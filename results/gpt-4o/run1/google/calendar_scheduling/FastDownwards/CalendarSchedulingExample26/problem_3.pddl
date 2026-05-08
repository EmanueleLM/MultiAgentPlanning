(define (problem schedule_meeting_problem)
    (:domain schedule_meeting)
    (:objects
        katherine nicole kevin - participant
        time_9_00 time_10_00 time_10_30 time_11_30 time_12_00
        time_13_00 time_14_00 time_15_00 time_15_30 time_16_30 - time_slot
    )

    (:init
        ; Participants' free schedule
        (is_free katherine time_9_00)
        (is_free katherine time_10_00)
        (is_free katherine time_10_30)
        (is_free katherine time_11_30)
        (is_free katherine time_12_00)
        (is_free katherine time_13_00)
        (is_free katherine time_14_00)
        (is_free katherine time_15_00)
        (is_free katherine time_15_30)
        (is_free katherine time_16_30)
        (is_free nicole time_9_00)
        (is_free nicole time_10_00)
        (is_free nicole time_10_30)
        (is_free nicole time_11_30)
        (is_free nicole time_12_00)
        (is_free nicole time_13_00)
        (is_free nicole time_14_00)
        (is_free nicole time_15_00)
        (is_free nicole time_15_30)
        (is_free nicole time_16_30)
        ; Kevin's calendar constraints
        (is_free kevin time_10_00)
        (is_free kevin time_11_30)
        (is_free kevin time_15_30)

        ; Mark the possible meeting time slots
        (meeting_possible time_11_30)
        (meeting_possible time_15_30)

        ; Define adjacency between time slots
        (adjacent time_9_00 time_10_00)
        (adjacent time_10_00 time_10_30)
        (adjacent time_10_30 time_11_30)
        (adjacent time_11_30 time_12_00)
        (adjacent time_12_00 time_13_00)
        (adjacent time_13_00 time_14_00)
        (adjacent time_14_00 time_15_00)
        (adjacent time_15_00 time_15_30)
        (adjacent time_15_30 time_16_30)
    )

    (:goal
        (exists (?t - time_slot)
            (and
                (meeting_scheduled katherine ?t)
                (meeting_scheduled nicole ?t)
                (meeting_scheduled kevin ?t)
            )
        )
    )
)