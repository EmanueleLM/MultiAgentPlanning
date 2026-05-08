(define (domain trip_planning_example6)
    (:requirements :strips :typing :negative-preconditions :equality)
    (:types
        day - object
        city - object
        traveler - object
        count - object
    )
    (:predicates
        (current_day ?d - day)
        (next_day ?d1 - day ?d2 - day)
        (at_city ?t - traveler ?c - city)
        (is_connected ?c1 - city ?c2 - city)
        (conference_required ?d - day ?c - city)
        (spent_day_in ?d - day ?c - city)
        ;; Predicates for day counts per city
        (current_berlin_days ?c - count)
        (current_dubrovnik_days ?c - count)
        (current_munich_days ?c - count)
        (next_count ?c1 - count ?c2 - count)
        (is_last_day ?d - day) ;; Added predicate to mark the last day (replaces unsupported 'exists')
    )

    ;; Action to spend the current day in BERLIN, stay, then transition to the next day.
    ;; No special conference precondition needed, as being in Berlin is compatible with conference days.
    (:action spend_day_and_stay_in_berlin
        :parameters (?t - traveler ?current - day ?next - day ?cb_old ?cb_new - count)
        :precondition (and
            (current_day ?current)
            (at_city ?t berlin)
            (next_day ?current ?next)
            (current_berlin_days ?cb_old)
            (next_count ?cb_old ?cb_new)
        )
        :effect (and
            (not (current_day ?current))
            (current_day ?next)
            (spent_day_in ?current berlin)
            (not (current_berlin_days ?cb_old))
            (current_berlin_days ?cb_new)
        )
    )

    ;; Action to spend the current day in DUBROVNIK, stay, then transition to the next day.
    (:action spend_day_and_stay_in_dubrovnik
        :parameters (?t - traveler ?current - day ?next - day ?cd_old ?cd_new - count)
        :precondition (and
            (current_day ?current)
            (at_city ?t dubrovnik)
            (next_day ?current ?next)
            ;; If conference is required in Berlin on ?current day, this action is forbidden.
            (not (conference_required ?current berlin))
            (current_dubrovnik_days ?cd_old)
            (next_count ?cd_old ?cd_new)
        )
        :effect (and
            (not (current_day ?current))
            (current_day ?next)
            (spent_day_in ?current dubrovnik)
            (not (current_dubrovnik_days ?cd_old))
            (current_dubrovnik_days ?cd_new)
        )
    )

    ;; Action to spend the current day in MUNICH, stay, then transition to the next day.
    (:action spend_day_and_stay_in_munich
        :parameters (?t - traveler ?current - day ?next - day ?cm_old ?cm_new - count)
        :precondition (and
            (current_day ?current)
            (at_city ?t munich)
            (next_day ?current ?next)
            ;; If conference is required in Berlin on ?current day, this action is forbidden.
            (not (conference_required ?current berlin))
            (current_munich_days ?cm_old)
            (next_count ?cm_old ?cm_new)
        )
        :effect (and
            (not (current_day ?current))
            (current_day ?next)
            (spent_day_in ?current munich)
            (not (current_munich_days ?cm_old))
            (current_munich_days ?cm_new)
        )
    )

    ;; Actions to spend the current day in 'from_c', then fly to 'to_c' for the next day.
    ;; Each fly action explicitly states the origin and increments the count for the origin city.

    ;; Fly from BERLIN to MUNICH
    ;; No special conference precondition needed, as spending the day in Berlin is compatible with conference days.
    (:action spend_day_and_fly_berlin_to_munich
        :parameters (?t - traveler ?current - day ?next - day ?cb_old ?cb_new - count)
        :precondition (and
            (current_day ?current)
            (at_city ?t berlin)
            (is_connected berlin munich)
            (next_day ?current ?next)
            (current_berlin_days ?cb_old)
            (next_count ?cb_old ?cb_new)
        )
        :effect (and
            (not (current_day ?current))
            (current_day ?next)
            (not (at_city ?t berlin))
            (at_city ?t munich)
            (spent_day_in ?current berlin)
            (not (current_berlin_days ?cb_old))
            (current_berlin_days ?cb_new)
        )
    )

    ;; Fly from MUNICH to BERLIN
    (:action spend_day_and_fly_munich_to_berlin
        :parameters (?t - traveler ?current - day ?next - day ?cm_old ?cm_new - count)
        :precondition (and
            (current_day ?current)
            (at_city ?t munich)
            (is_connected munich berlin)
            (next_day ?current ?next)
            ;; Conference constraint (forbidden if conference in berlin on ?current day)
            (not (conference_required ?current berlin))
            (current_munich_days ?cm_old)
            (next_count ?cm_old ?cm_new)
        )
        :effect (and
            (not (current_day ?current))
            (current_day ?next)
            (not (at_city ?t munich))
            (at_city ?t berlin)
            (spent_day_in ?current munich)
            (not (current_munich_days ?cm_old))
            (current_munich_days ?cm_new)
        )
    )

    ;; Fly from MUNICH to DUBROVNIK
    (:action spend_day_and_fly_munich_to_dubrovnik
        :parameters (?t - traveler ?current - day ?next - day ?cm_old ?cm_new - count)
        :precondition (and
            (current_day ?current)
            (at_city ?t munich)
            (is_connected munich dubrovnik)
            (next_day ?current ?next)
            ;; Conference constraint (forbidden if conference in berlin on ?current day)
            (not (conference_required ?current berlin))
            (current_munich_days ?cm_old)
            (next_count ?cm_old ?cm_new)
        )
        :effect (and
            (not (current_day ?current))
            (current_day ?next)
            (not (at_city ?t munich))
            (at_city ?t dubrovnik)
            (spent_day_in ?current munich)
            (not (current_munich_days ?cm_old))
            (current_munich_days ?cm_new)
        )
    )

    ;; Fly from DUBROVNIK to MUNICH
    (:action spend_day_and_fly_dubrovnik_to_munich
        :parameters (?t - traveler ?current - day ?next - day ?cd_old ?cd_new - count)
        :precondition (and
            (current_day ?current)
            (at_city ?t dubrovnik)
            (is_connected dubrovnik munich)
            (next_day ?current ?next)
            ;; Conference constraint (forbidden if conference in berlin on ?current day)
            (not (conference_required ?current berlin))
            (current_dubrovnik_days ?cd_old)
            (next_count ?cd_old ?cd_new)
        )
        :effect (and
            (not (current_day ?current))
            (current_day ?next)
            (not (at_city ?t dubrovnik))
            (at_city ?t munich)
            (spent_day_in ?current dubrovnik)
            (not (current_dubrovnik_days ?cd_old))
            (current_dubrovnik_days ?cd_new)
        )
    )

    ;; Action to finish the trip after day 8. This action consumes day8 and increments final day count.
    ;; This action is only possible if it is explicitly marked as the last day.

    ;; End trip in BERLIN
    ;; No special conference precondition needed, as ending the last day in Berlin is compatible.
    (:action end_trip_in_berlin
        :parameters (?t - traveler ?day8 - day ?cb_old ?cb_new - count)
        :precondition (and
            (current_day ?day8)
            (at_city ?t berlin)
            (is_last_day ?day8) ;; Replaced unsupported 'exists'
            (current_berlin_days ?cb_old)
            (next_count ?cb_old ?cb_new)
        )
        :effect (and
            (not (current_day ?day8)) ; No 'next_day' for day 8, so current_day becomes false.
            (spent_day_in ?day8 berlin)
            (not (current_berlin_days ?cb_old))
            (current_berlin_days ?cb_new)
        )
    )

    ;; End trip in DUBROVNIK
    (:action end_trip_in_dubrovnik
        :parameters (?t - traveler ?day8 - day ?cd_old ?cd_new - count)
        :precondition (and
            (current_day ?day8)
            (at_city ?t dubrovnik)
            (is_last_day ?day8) ;; Replaced unsupported 'exists'
            ;; Conference constraint (forbidden if conference in berlin on ?day8)
            (not (conference_required ?day8 berlin))
            (current_dubrovnik_days ?cd_old)
            (next_count ?cd_old ?cd_new)
        )
        :effect (and
            (not (current_day ?day8))
            (spent_day_in ?day8 dubrovnik)
            (not (current_dubrovnik_days ?cd_old))
            (current_dubrovnik_days ?cd_new)
        )
    )

    ;; End trip in MUNICH
    (:action end_trip_in_munich
        :parameters (?t - traveler ?day8 - day ?cm_old ?cm_new - count)
        :precondition (and
            (current_day ?day8)
            (at_city ?t munich)
            (is_last_day ?day8) ;; Replaced unsupported 'exists'
            ;; Conference constraint (forbidden if conference in berlin on ?day8)
            (not (conference_required ?day8 berlin))
            (current_munich_days ?cm_old)
            (next_count ?cm_old ?cm_new)
        )
        :effect (and
            (not (current_day ?day8))
            (spent_day_in ?day8 munich)
            (not (current_munich_days ?cm_old))
            (current_munich_days ?cm_new)
        )
    )
)