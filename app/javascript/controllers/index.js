import { Application } from "@hotwired/stimulus";
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";
import CategoriesController from "./categories_controller";

const application = Application.start();
eagerLoadControllersFrom("controllers", application);
//application.register("categories", CategoriesController);
