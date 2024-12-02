class_name MessageEffect extends Effect

@export_multiline var message:String
    
func apply(u:Entity, t:Entity,s:ItemData=null):
    Signals.send_message.emit(message)
