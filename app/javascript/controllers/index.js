// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import AlertController from "./alert_controller"
application.register("alert", AlertController)

import CollapseController from "./collapse_controller"
application.register("collapse", CollapseController)

import DropdownController from "./dropdown_controller"
application.register("dropdown", DropdownController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import TabDashboardController from "./tab_dashboard_controller"
application.register("tab-dashboard", TabDashboardController)

import WalletController from "./wallet_controller"
application.register("wallet", WalletController)
