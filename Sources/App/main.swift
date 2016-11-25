import Vapor

let drop = Droplet()

drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
}

drop.get("name/:name/age/:age") { request in
    if let name = request.parameters["name"]?.string, let age = request.parameters["age"]?.string {
        return try JSON(node: ["code": 200, "msg": "success", "object": "\(name) is \(age)"])
    } else {
        return try JSON(node: ["code": 200, "msg": "failure"])
    }
}

drop.resource("posts", PostController())

drop.run()
