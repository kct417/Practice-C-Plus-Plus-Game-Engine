#pragma once

#include "gepch.h"

#include "Core/Base.h"

namespace Engine
{

    enum class EventType
    {
        None = 0,
        WindowClose,
        WindowResize,
        WindowFocus,
        WindowLostFocus,
        WindowMoved,
        AppTick,
        AppUpdate,
        AppRender,
        KeyPressed,
        KeyReleased,
        MouseButtonPressed,
        MouseButtonReleased,
        MouseMoved,
        MouseScrolled
    };

    enum EventCategory
    {
        None = 0,
        EventCategoryApplication = BIT(0),
        EventCategoryInput = BIT(1),
        EventCategoryKeyboard = BIT(2),
        EventCategoryMouse = BIT(3),
        EventCategoryMouseButton = BIT(4)
    };

#define EVENT_CLASS_TYPE(type)                                                  \
    static EventType GetStaticType() { return EventType::type; }                \
    virtual EventType GetEventType() const override { return GetStaticType(); } \
    virtual const char *GetName() const override { return #type; }

#define EVENT_CLASS_CATEGORY(category) \
    virtual int GetCategoryFlags() const override { return category; }

    class ENGINE_API Event
    {
        friend class EventDispatcher;

    public:
        virtual EventType GetEventType() const = 0;
        virtual const char *GetName() const = 0;
        virtual int GetCategoryFlags() const = 0;
        virtual std::string ToString() const { return GetName(); }

        inline bool IsInCategory(EventCategory category)
        {
            return GetCategoryFlags() & category;
        }

    protected:
        bool m_Handled = false;
    };

    class EventDispatcher
    {
        template <typename T>
        using EventFn = std::function<bool(T &)>;

    public:
        EventDispatcher(Event &event)
            : m_Event(event)
        {
        }

        template <typename T>
        bool Dispatch(EventFn<T> func)
        {
            if (m_Event.GetEventType() == T::GetStaticType())
            {
                m_Event.m_Handled = func(*(T *)&m_Event);
                return true;
            }
            return false;
        }

    private:
        Event &m_Event;
    };

    inline std::ostream &operator<<(std::ostream &stream, const Event &event)
    {
        return stream << event.ToString();
    }

}

template <typename T>
struct fmt::formatter<T, std::enable_if_t<std::is_base_of_v<Engine::Event, T>, char>>
{
    constexpr auto parse(format_parse_context &context) -> decltype(context.begin())
    {
        return context.end();
    }

    template <typename U>
    auto format(const T &event, U &context) -> decltype(context.out())
    {
        return fmt::format_to(context.out(), "{}", event.ToString());
    }
};
