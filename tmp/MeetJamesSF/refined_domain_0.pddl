(define (domain integrated-meeting)
    (:requirements :strips :typing :negative-preconditions :equality)

    (:types person location timepoint)

    (:predicates
        (at ?person - person ?loc - location)
        (met ?person1 - person ?person2 - person)
        (at-time ?t - timepoint)
        (next-time ?t1 ?t2 - timepoint)
        (can-meet ?person1 - person ?person2 - person)
    )

    ;; Timeline as symbolic timepoints
    (next-time t540 t555) ; 09:00 to 09:15
    (next-time t555 t945) ; Fast forward to 15:45
    (next-time t945 t960) ; 15:45 to 16:00
    (next-time t960 t1050) ; 16:00 to 17:30
    (next-time t1050 t1200) ; 17:30 to 20:00

    ;; Agent 1's Actions
    (:action travel
        :parameters (?person - person ?from ?to - location ?t1 ?t2 - timepoint)
        :precondition (and (at ?person ?from) (at-time ?t1) (next-time ?t1 ?t2))
        :effect (and (at ?person ?to) (not (at ?person ?from)) (at-time ?t2))
    )

    ;; Wait action
    (:action wait
        :parameters (?person - person ?loc - location ?t1 ?t2 - timepoint)
        :precondition (and (at ?person ?loc) (at-time ?t1) (next-time ?t1 ?t2))
        :effect (and (at ?person ?loc) (at-time ?t2))
    )

    ;; Meet action
    (:action meet
        :parameters (?person1 - person ?person2 - person ?t1 ?t2 ?t3 - timepoint)
        :precondition (and
            (at ?person1 alamo-square)
            (at ?person2 alamo-square)
            (at-time ?t1)
            (next-time ?t1 ?t2)
            (next-time ?t2 ?t3)
            (can-meet ?person1 ?person2)
        )
        :effect (met ?person1 ?person2)
    )
)