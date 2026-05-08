(define (problem calendar_scheduling_example35_problem)
    (:domain calendar_scheduling_example35)
    (:objects
        bradley zachary teresa - person
        t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time_slot
    )
    (:init
        (is_person bradley)
        (is_person zachary)
        (is_person teresa)

        (is_time_slot t0900) (is_time_slot t0930) (is_time_slot t1000) (is_time_slot t1030)
        (is_time_slot t1100) (is_time_slot t1130) (is_time_slot t1200) (is_time_slot t1230)
        (is_time_slot t1300) (is_time_slot t1330) (is_time_slot t1400) (is_time_slot t1430)
        (is_time_slot t1500) (is_time_slot t1530) (is_time_slot t1600) (is_time_slot t1630)

        ; Bradley's availability (free the entire day)
        (available bradley t0900) (available bradley t0930) (available bradley t1000) (available bradley t1030)
        (available bradley t1100) (available bradley t1130) (available bradley t1200) (available bradley t1230)
        (available bradley t1300) (available bradley t1330) (available bradley t1400) (available bradley t1430)
        (available bradley t1500) (available bradley t1530) (available bradley t1600) (available bradley t1630)

        ; Zachary's availability (blocked 10:00-10:30 (t1000), 15:00-15:30 (t1500))
        (available zachary t0900) (available zachary t0930)
        (available zachary t1030)
        (available zachary t1100) (available zachary t1130) (available zachary t1200) (available zachary t1230)
        (available zachary t1300) (available zachary t1330) (available zachary t1400) (available zachary t1430)
        (available zachary t1530)
        (available zachary t1600) (available zachary t1630)

        ; Teresa's availability (blocked 9:00-10:30, 11:00-12:30, 13:00-14:00, 14:30-16:30)
        (available teresa t1030)
        (available teresa t1230)
        (available teresa t1400)
        (available teresa t1630)

        ; Bradley's preferences (does not want to meet before 14:30)
        (preferred_by_bradley t1430)
        (preferred_by_bradley t1500)
        (preferred_by_bradley t1530)
        (preferred_by_bradley t1600)
        (preferred_by_bradley t1630)

        ; Initial state: no meeting has been scheduled yet
        (not (has_meeting_scheduled))
    )
    (:goal (has_meeting_scheduled))
)