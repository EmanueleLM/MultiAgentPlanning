(define (problem MeetEachOther)
    (:domain MeetingDomain)
    (:objects
        alice bob - person
        room1 room2 - room
    )
    (:init
        (in_room alice room1)
        (in_room bob room2)
        (connected room1 room2)
        (connected room2 room1)
    )
    (:goal
        (and
            (met alice bob)
            (met bob alice)
        )
    )
)