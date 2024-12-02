class_name Item extends Resource

var data:ItemData
var quantity:int

func create_item(n:String, q:int):
    data = load("res://resources/items/"+n+".tres")
    quantity=q
    
func use(u:Entity, t:Entity):
    for x in data.effect:
        x.apply(u,t,data)
