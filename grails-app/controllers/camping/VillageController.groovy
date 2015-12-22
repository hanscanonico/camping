package camping



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VillageController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Village.list(params), model:[villageInstanceCount: Village.count()]
    }

    def show(Village villageInstance) {
        respond villageInstance
    }

    def create() {
        respond new Village(params)
    }

    @Transactional
    def save(Village villageInstance) {
        if (villageInstance == null) {
            notFound()
            return
        }

        if (villageInstance.hasErrors()) {
            respond villageInstance.errors, view:'create'
            return
        }

        villageInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'village.label', default: 'Village'), villageInstance.id])
                redirect villageInstance
            }
            '*' { respond villageInstance, [status: CREATED] }
        }
    }

    def edit(Village villageInstance) {
        respond villageInstance
    }

    @Transactional
    def update(Village villageInstance) {
        if (villageInstance == null) {
            notFound()
            return
        }

        if (villageInstance.hasErrors()) {
            respond villageInstance.errors, view:'edit'
            return
        }

        villageInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Village.label', default: 'Village'), villageInstance.id])
                redirect villageInstance
            }
            '*'{ respond villageInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Village villageInstance) {

        if (villageInstance == null) {
            notFound()
            return
        }

        villageInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Village.label', default: 'Village'), villageInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'village.label', default: 'Village'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
