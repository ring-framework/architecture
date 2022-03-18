runtime_system = softwareSystem "Runtime" {

    group "Core Modules" {
        !include containers/browser_api_adapter.dsl
        !include containers/dependency_injection.dsl
        !include containers/event_bus.dsl
        !include containers/events_handler.dsl
        !include containers/renderer.dsl
        !include containers/http_client.dsl

        event_bus_container -> renderer_container "Sends data to render"
        renderer_container -> browser_api_adapter_container "Calls Web API functions"
        browser_api_adapter_container -> events_handler_container "Retranslates user and browser events"
        events_handler_container -> event_bus_container "Sends events as framework events"
        http_client_container -> event_bus_container "Sends response events"
        event_bus_container -> http_client_container "Sends request events"
        http_client_container -> browser_api_adapter_container "Calls fetch"

        dependency_injection_container -> events_handler_container "Provides dependencies"
        dependency_injection_container -> http_client_container "Provides dependencies"
        dependency_injection_container -> renderer_container "Provides dependencies"
        dependency_injection_container -> browser_api_adapter_container "Provides dependencies"

    }
}
