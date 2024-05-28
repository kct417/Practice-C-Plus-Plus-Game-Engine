#include "gepch.h"

#include "Core/Application.h"
#include "Core/Log.h"
#include "Events/ApplicationEvent.h"

namespace Engine
{

    Application::Application() {}

    Application::~Application() {}

    void Application::Run()
    {
        WindowResizeEvent event(1440, 810);
        if (event.IsInCategory(EventCategoryApplication))
        {
            GE_TRACE(event);
        }
        if (event.IsInCategory(EventCategoryInput))
        {
            GE_TRACE(event);
        }

        while (true)
            ;
    }

}
