package camping



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PaysController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Pays.list(params), model:[paysInstanceCount: Pays.count()]
    }

    def show(Pays paysInstance) {
        respond paysInstance
    }

    def create() {
        respond new Pays(params)
    }

    @Transactional
    def save(Pays paysInstance) {
        if (paysInstance == null) {
            notFound()
            return
        }

        if (paysInstance.hasErrors()) {
            respond paysInstance.errors, view:'create'
            return
        }

        paysInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'pays.label', default: 'Pays'), paysInstance.id])
                redirect paysInstance
            }
            '*' { respond paysInstance, [status: CREATED] }
        }
    }

    def edit(Pays paysInstance) {
        respond paysInstance
    }

    @Transactional
    def update(Pays paysInstance) {
        if (paysInstance == null) {
            notFound()
            return
        }

        if (paysInstance.hasErrors()) {
            respond paysInstance.errors, view:'edit'
            return
        }

        paysInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Pays.label', default: 'Pays'), paysInstance.id])
                redirect paysInstance
            }
            '*'{ respond paysInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Pays paysInstance) {

        if (paysInstance == null) {
            notFound()
            return
        }

        paysInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Pays.label', default: 'Pays'), paysInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'pays.label', default: 'Pays'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
