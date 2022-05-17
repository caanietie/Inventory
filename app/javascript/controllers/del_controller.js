import { Controller } from "@hotwired/stimulus"
export default class extends Controller{
	static values = { what: String }

	conf(event){
		if(!confirm("Delete this " + this.whatValue + "?"))
			event.preventDefault()
	}
}
