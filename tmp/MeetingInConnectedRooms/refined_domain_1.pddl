(define (domain MeetingDomainFD)
    (:requirements :strips :typing)
    (:types person room)
    (:predicates 
        (in_room ?x - person ?room - room)
        (connected ?room1 - room ?room2 - room)
        (met ?x - person ?y - person)
    )

    ;; Alice's actions
    (:action move_alice
        :parameters (?from - room ?to - room)
        :precondition (and (in_room alice ?from) (connected ?from ?to))
        :effect (and (not (in_room alice ?from)) (in_room alice ?to))
    )

    (:action meet_alice
        :parameters (?y - person ?room - room)
        :precondition (and (in_room alice ?room) (in_room ?y ?room))
        :effect (met alice ?y)
    )

    ;; Bob's actions
    (:action move_bob
        :parameters (?from - room ?to - room)
        :precondition (and (in_room bob ?from) (connected ?from ?to))
        :effect (and (not (in_room bob ?from)) (in_room bob ?to))
    )

    (:action meet_bob
        :parameters (?y - person ?room - room)
        :precondition (and (in_room bob ?room) (in_room ?y ?room))
        :effect (met bob ?y)
    )
)