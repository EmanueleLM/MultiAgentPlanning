(define (domain trip-planning-9day)
    (:requirements :strips :typing :negative-preconditions)

    (:types
        city
        day
        count ; Used for tracking stay days (0 to 6)
    )

    (:predicates
        (direct-flight ?c1 - city ?c2 - city)
        (at ?c - city) ; Current location
        (next-day ?d1 - day ?d2 - day) ; Sequence of days
        (current-day ?d - day) ; Marker for temporal progression
        (visited ?c - city) ; Visited city
        (nice-meeting-held) ; Meeting constraint met

        ;; Stay tracking predicates (Adjusted goals: B=2, V=1, N=6)
        (stay-b ?c - count) 
        (stay-v ?c - count) 
        (stay-n ?c - count) 
        (next-count ?c1 - count ?c2 - count)
    )

    ;; 1. Travel Action (Commutes are instantaneous and must use direct flights)
    (:action commute
        :parameters (?from - city ?to - city)
        :precondition
            (and
                (at ?from)
                (direct-flight ?from ?to)
            )
        :effect
            (and
                (not (at ?from))
                (at ?to)
                (visited ?to)
            )
    )

    ;; 2. Stay in Brussels (Max 2 days)
    (:action stay-in-brussels
        :parameters (?d_current - day ?d_next - day ?c_old - count ?c_new - count)
        :precondition
            (and
                (current-day ?d_current)
                (next-day ?d_current ?d_next)
                (at Brussels)
                (stay-b ?c_old)
                (next-count ?c_old ?c_new)
                (not (stay-b C2)) ; Stop when count C2 is reached (prevents C2 -> C3 transition)
            )
        :effect
            (and
                (not (current-day ?d_current))
                (current-day ?d_next)
                (not (stay-b ?c_old))
                (stay-b ?c_new)
            )
    )
    
    ;; 3. Stay in Valencia (Max 1 day)
    (:action stay-in-valencia
        :parameters (?d_current - day ?d_next - day ?c_old - count ?c_new - count)
        :precondition
            (and
                (current-day ?d_current)
                (next-day ?d_current ?d_next)
                (at Valencia)
                (stay-v ?c_old)
                (next-count ?c_old ?c_new)
                (not (stay-v C1)) ; Stop when count C1 is reached
            )
        :effect
            (and
                (not (current-day ?d_current))
                (current-day ?d_next)
                (not (stay-v ?c_old))
                (stay-v ?c_new)
            )
    )

    ;; 4. Stay and Meet in Nice (Must be used exactly once, before C6 is reached)
    (:action stay-and-meet-in-nice
        :parameters (?d_current - day ?d_next - day ?c_old - count ?c_new - count)
        :precondition
            (and
                (current-day ?d_current)
                (next-day ?d_current ?d_next)
                (at Nice)
                (stay-n ?c_old)
                (next-count ?c_old ?c_new)
                (not (nice-meeting-held))
                (not (stay-n C6)) ; Stop after 6 days 
            )
        :effect
            (and
                (not (current-day ?d_current))
                (current-day ?d_next)
                (not (stay-n ?c_old))
                (stay-n ?c_new)
                (nice-meeting-held)
            )
    )
    
    ;; 5. Stay in Nice (Normal Stay, available only after meeting is held)
    (:action stay-in-nice-normal
        :parameters (?d_current - day ?d_next - day ?c_old - count ?c_new - count)
        :precondition
            (and
                (current-day ?d_current)
                (next-day ?d_current ?d_next)
                (at Nice)
                (stay-n ?c_old)
                (next-count ?c_old ?c_new)
                (nice-meeting-held)
                (not (stay-n C6))
            )
        :effect
            (and
                (not (current-day ?d_current))
                (current-day ?d_next)
                (not (stay-n ?c_old))
                (stay-n ?c_new)
            )
    )
)