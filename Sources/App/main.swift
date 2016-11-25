import Vapor

let drop = Droplet()

drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
}

drop.get("name/:name/age/:age") { request in
    if let name = request.parameters["name"]?.string, let age = request.parameters["age"]?.string {
        return "\(name) is \(age)!"
    }
    return "Error retrieving parameters."
}

drop.resource("posts", PostController())

drop.run()
