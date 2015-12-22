package camping



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ContinentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Continent.list(params), model:[continentInstanceCount: Continent.count()]
    }

    def show(Continent continentInstance) {
        respond continentInstance
    }

    def create() {
        respond new Continent(params)
    }

    @Transactional
    def save(Continent continentInstance) {
        if (continentInstance == null) {
            notFound()
            return
        }

        if (continentInstance.hasErrors()) {
            respond continentInstance.errors, view:'create'
            return
        }

        continentInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'continent.label', default: 'Continent'), continentInstance.id])
                redirect continentInstance
            }
            '*' { respond continentInstance, [status: CREATED] }
        }
    }

    def edit(Continent continentInstance) {
        respond continentInstance
    }

    @Transactional
    def update(Continent continentInstance) {
        if (continentInstance == null) {
            notFound()
            return
        }

        if (continentInstance.hasErrors()) {
            respond continentInstance.errors, view:'edit'
            return
        }

        continentInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Continent.label', default: 'Continent'), continentInstance.id])
                redirect continentInstance
            }
            '*'{ respond continentInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Continent continentInstance) {

        if (continentInstance == null) {
            notFound()
            return
        }

        continentInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Continent.label', default: 'Continent'), continentInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'continent.label', default: 'Continent'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
