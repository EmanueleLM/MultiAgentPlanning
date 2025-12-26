(define (domain calendar-scheduling-28)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        person
        time
    )
    (:predicates
        (available ?p - person ?t - time)
        (meeting-scheduled)
        (selected-time ?t - time)
    )

    (:functions
        (total-cost)
    )

    (:action schedule-t1
        :parameters ()
        :precondition (and
            (available brittany t1) (available emily t1) (available doris t1)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time t1)
            (increase (total-cost) 1)
        )
    )
    (:action schedule-t2
        :parameters ()
        :precondition (and
            (available brittany t2) (available emily t2) (available doris t2)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time t2)
            (increase (total-cost) 2)
        )
    )
    (:action schedule-t3
        :parameters ()
        :precondition (and
            (available brittany t3) (available emily t3) (available doris t3)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time t3)
            (increase (total-cost) 3)
        )
    )
    (:action schedule-t4
        :parameters ()
        :precondition (and
            (available brittany t4) (available emily t4) (available doris t4)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time t4)
            (increase (total-cost) 4)
        )
    )
    (:action schedule-t5
        :parameters ()
        :precondition (and
            (available brittany t5) (available emily t5) (available doris t5)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time t5)
            (increase (total-cost) 5)
        )
    )
    (:action schedule-t6
        :parameters ()
        :precondition (and
            (available brittany t6) (available emily t6) (available doris t6)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time t6)
            (increase (total-cost) 6)
        )
    )
    (:action schedule-t7
        :parameters ()
        :precondition (and
            (available brittany t7) (available emily t7) (available doris t7)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time t7)
            (increase (total-cost) 7)
        )
    )
    (:action schedule-t8
        :parameters ()
        :precondition (and
            (available brittany t8) (available emily t8) (available doris t8)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time t8)
            (increase (total-cost) 8)
        )
    )
    (:action schedule-t9
        :parameters ()
        :precondition (and
            (available brittany t9) (available emily t9) (available doris t9)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time t9)
            (increase (total-cost) 9)
        )
    )
    (:action schedule-t10
        :parameters ()
        :precondition (and
            (available brittany t10) (available emily t10) (available doris t10)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time t10)
            (increase (total-cost) 10)
        )
    )
    (:action schedule-t11
        :parameters ()
        :precondition (and
            (available brittany t11) (available emily t11) (available doris t11)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time t11)
            (increase (total-cost) 11)
        )
    )
    (:action schedule-t12
        :parameters ()
        :precondition (and
            (available brittany t12) (available emily t12) (available doris t12)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time t12)
            (increase (total-cost) 12)
        )
    )
    (:action schedule-t13
        :parameters ()
        :precondition (and
            (available brittany t13) (available emily t13) (available doris t13)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time t13)
            (increase (total-cost) 13)
        )
    )
    (:action schedule-t14
        :parameters ()
        :precondition (and
            (available brittany t14) (available emily t14) (available doris t14)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time t14)
            (increase (total-cost) 14)
        )
    )
    (:action schedule-t15
        :parameters ()
        :precondition (and
            (available brittany t15) (available emily t15) (available doris t15)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time t15)
            (increase (total-cost) 15)
        )
    )
    (:action schedule-t16
        :parameters ()
        :precondition (and
            (available brittany t16) (available emily t16) (available doris t16)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time t16)
            (increase (total-cost) 16)
        )
    )
)