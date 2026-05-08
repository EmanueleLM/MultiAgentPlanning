(define (domain meeting-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs :numeric-fluents)

    (:types
        person
        location
    )

    (:constants
        traveler - person
        jessica - person
        haight-ashbury sunset-district - location
    )

    (:predicates
        (at ?p - person ?l - location)
        (meeting-completed)
        (traveler-at-destination-for-meeting) ; Helper predicate to ensure traveler is ready at the meeting location
    )

    (:functions
        (current-time) ; Global time in minutes from a reference point (e.g., midnight)
        (total-cost)   ; Accumulated cost for the plan (e.g., total time spent)
    )

    (:action wait-for-departure
        :parameters ()
        :precondition (and
            (at traveler haight-ashbury)
            (< (current-time) 900) ; Wait until 3:00 PM (900 minutes from midnight) to depart
        )
        :effect (and
            (increase (total-cost) (- 900 (current-time))) ; Cost is the duration of waiting
            (assign (current-time) 900) ; Set current time to 3:00 PM
        )
    )

    (:action travel-to-sunset-district
        :parameters ()
        :precondition (and
            (at traveler haight-ashbury)
            (= (current-time) 900) ; Must depart precisely at 3:00 PM
        )
        :effect (and
            (not (at traveler haight-ashbury))
            (at traveler sunset-district)
            (increase (current-time) 15) ; Travel time is 15 minutes, arriving at 3:15 PM (915 min)
            (traveler-at-destination-for-meeting)
            (increase (total-cost) 15) ; Add travel time to total cost
        )
    )

    (:action meet-jessica
        :parameters ()
        :precondition (and
            (traveler-at-destination-for-meeting) ; Traveler must have arrived at the meeting location
            (at traveler sunset-district)
            (= (current-time) 915) ; Traveler must be at Sunset District at 3:15 PM (915 min)
            (>= (current-time) 915) ; Jessica's availability starts at 3:15 PM
            (<= (+ (current-time) 90) 1215) ; Meeting must end by 8:15 PM (1215 min). 915 + 90 = 1005 <= 1215
            (not (meeting-completed)) ; Ensure meeting is not already completed
        )
        :effect (and
            (increase (current-time) 90) ; Meeting lasts for 90 minutes
            (meeting-completed)
            (increase (total-cost) 90) ; Add meeting duration to total cost
        )
    )
)