(define (domain integrated_trip_planning)
    (:requirements :strips :typing :fluents :numeric-fluents :durative-actions)

    (:types city)

    (:predicates
        (at ?c - city)
        (direct-flight ?c1 ?c2 - city)
        (relatives-visited)
        (visited ?c - city) ; Ensure all cities are reached
    )

    (:functions
        (total-trip-time)
        (stay-lyon)
        (stay-bucharest)
        (stay-manchester)
    )

    ;; --------------------
    ;; TRAVEL ACTION (1 Day duration)
    ;; --------------------
    (:durative-action fly
        :parameters (?from - city ?to - city)
        :duration (= ?duration 1)
        :condition
            (and
                (at start (at ?from))
                (at start (direct-flight ?from ?to))
            )
        :effect
            (and
                (at start (not (at ?from)))
                (at end (at ?to))
                (at end (increase (total-trip-time) ?duration))
                (at end (visited ?to))
            )
    )

    ;; --------------------
    ;; STAY ACTIONS (Variable duration ?d)
    ;; --------------------

    (:durative-action stay_lyon
        :parameters (?d)
        :duration (= ?duration ?d)
        :condition
            (and
                (at start (at lyon))
                (at start (> ?d 0))
            )
        :effect
            (and
                (at end (increase (total-trip-time) ?duration))
                (at end (increase (stay-lyon) ?duration))
            )
    )

    (:durative-action stay_bucharest
        :parameters (?d)
        :duration (= ?duration ?d)
        :condition
            (and
                (at start (at bucharest))
                (at start (> ?d 0))
            )
        :effect
            (and
                (at end (increase (total-trip-time) ?duration))
                (at end (increase (stay-bucharest) ?duration))
            )
    )

    (:durative-action stay_manchester
        :parameters (?d)
        :duration (= ?duration ?d)
        :condition
            (and
                (at start (at manchester))
                (at start (> ?d 0))
            )
        :effect
            (and
                (at end (increase (total-trip-time) ?duration))
                (at end (increase (stay-manchester) ?duration))
            )
    )

    ;; --------------------
    ;; RELATIVES VISIT (1 Day duration, Specific temporal window: Day 13 to Day 17)
    ;; --------------------
    ; Must occur between Day 13 and Day 17 (inclusive). 
    ; Start time (T_start) must be >= 12. End time (T_start + 1) must be <= 17. 
    (:durative-action visit_relatives
        :parameters ()
        :duration (= ?duration 1)
        :condition
            (and
                (at start (at lyon))
                (at start (not (relatives-visited)))
                ; Day 13 starts when time reaches 12
                (at start (>= (total-trip-time) 12)) 
                ; Must finish by Day 17 end (T_start must be <= 16)
                (at start (<= (total-trip-time) 16)) 
            )
        :effect
            (and
                (at end (relatives-visited))
                (at end (increase (total-trip-time) ?duration))
                (at end (increase (stay-lyon) ?duration))
            )
    )
)