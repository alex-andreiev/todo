import { application } from "./application"
import CloseFormController from "./close_form_controller"
import FlashController from "./flash_controller"
import HelloController from "./hello_controller"
import ReorderController from "./reorder_controller"
import TaskReorderController from "./task_reorder_controller"

application.register("close-form", CloseFormController)
application.register("flash", FlashController)
application.register("hello", HelloController)
application.register("reorder", ReorderController)
application.register("task-reorder", TaskReorderController)
