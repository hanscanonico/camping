package camping



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ProposerController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Proposer.list(params), model:[proposerInstanceCount: Proposer.count()]
    }

    def show(Proposer proposerInstance) {
        respond proposerInstance
    }

    def create() {
        respond new Proposer(params)
    }

    @Transactional
    def save(Proposer proposerInstance) {
        if (proposerInstance == null) {
            notFound()
            return
        }

        if (proposerInstance.hasErrors()) {
            respond proposerInstance.errors, view:'create'
            return
        }

        proposerInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'proposer.label', default: 'Proposer'), proposerInstance.id])
                redirect proposerInstance
            }
            '*' { respond proposerInstance, [status: CREATED] }
        }
    }

    def edit(Proposer proposerInstance) {
        respond proposerInstance
    }

    @Transactional
    def update(Proposer proposerInstance) {
        if (proposerInstance == null) {
            notFound()
            return
        }

        if (proposerInstance.hasErrors()) {
            respond proposerInstance.errors, view:'edit'
            return
        }

        proposerInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Proposer.label', default: 'Proposer'), proposerInstance.id])
                redirect proposerInstance
            }
            '*'{ respond proposerInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Proposer proposerInstance) {

        if (proposerInstance == null) {
            notFound()
            return
        }

        proposerInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Proposer.label', default: 'Proposer'), proposerInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'proposer.label', default: 'Proposer'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
