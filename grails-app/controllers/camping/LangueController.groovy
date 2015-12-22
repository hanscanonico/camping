package camping



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LangueController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Langue.list(params), model:[langueInstanceCount: Langue.count()]
    }

    def show(Langue langueInstance) {
        respond langueInstance
    }

    def create() {
        respond new Langue(params)
    }

    @Transactional
    def save(Langue langueInstance) {
        if (langueInstance == null) {
            notFound()
            return
        }

        if (langueInstance.hasErrors()) {
            respond langueInstance.errors, view:'create'
            return
        }

        langueInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'langue.label', default: 'Langue'), langueInstance.id])
                redirect langueInstance
            }
            '*' { respond langueInstance, [status: CREATED] }
        }
    }

    def edit(Langue langueInstance) {
        respond langueInstance
    }

    @Transactional
    def update(Langue langueInstance) {
        if (langueInstance == null) {
            notFound()
            return
        }

        if (langueInstance.hasErrors()) {
            respond langueInstance.errors, view:'edit'
            return
        }

        langueInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Langue.label', default: 'Langue'), langueInstance.id])
                redirect langueInstance
            }
            '*'{ respond langueInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Langue langueInstance) {

        if (langueInstance == null) {
            notFound()
            return
        }

        langueInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Langue.label', default: 'Langue'), langueInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'langue.label', default: 'Langue'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
