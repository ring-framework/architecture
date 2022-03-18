workspace {
    name "Ring Framework Architecture"
    description "Framework for building modular and efficient applications"
    !adrs src/decisions

    model {
        !include src/systems/web_browser.dsl

        enterprise "Ring Framework" {
            !include src/systems/development_toolkit.dsl
            !include src/systems/runtime/system.dsl
        }

        !include src/persons/application_end_user.dsl
        !include src/persons/framework_end_user.dsl

        framework_end_user -> development_toolkit_system "Builds application"
        development_toolkit_system -> framework_end_user "Provides reports"

        development_toolkit_system -> runtime_system "Generates result bundle"

        application_end_user -> web_browser_system "Interacts"
        web_browser_system -> application_end_user "Responds"
    }

    !include src/views.dsl
}
