(define (problem schedule-earliest-common-slot)
    (:domain calendar-scheduling-integration)
    (:objects
        theresa charles betty - agent
        P540 P570 P600 P630 P660 P690 P720 P750 P780 P810 P840 P870 P900 P930 P960 - time-point
    )

    (:init
        (= (total-cost) 0)

        ;; Define numerical values (minutes)
        (= (time-value P540) 540)
        (= (time-value P570) 570)
        (= (time-value P600) 600)
        (= (time-value P630) 630)
        (= (time-value P660) 660)
        (= (time-value P690) 690)
        (= (time-value P720) 720)
        (= (time-value P750) 750)
        (= (time-value P780) 780)
        (= (time-value P810) 810)
        (= (time-value P840) 840)
        (= (time-value P870) 870)
        (= (time-value P900) 900)
        (= (time-value P930) 930)
        (= (time-value P960) 960)

        ;; Define valid start times (9:00 to 16:00)
        (is-start-time P540) (is-start-time P570) (is-start-time P600) (is-start-time P630) 
        (is-start-time P660) (is-start-time P690) (is-start-time P720) (is-start-time P750) 
        (is-start-time P780) (is-start-time P810) (is-start-time P840) (is-start-time P870) 
        (is-start-time P900) (is-start-time P930) (is-start-time P960) 

        ;; --- Theresa Busy Constraints (derived from [540, 570), [750, 810), [840, 900), [990, 1020)) ---
        (busy theresa P540)
        (busy theresa P720) (busy theresa P750) (busy theresa P780) 
        (busy theresa P810) (busy theresa P840)
        (busy theresa P960) ; 16:00 start overlaps with 16:30-17:00

        ;; --- Charles Busy Constraints (derived from [600, 630), [690, 750), [840, 930)) ---
        (busy charles P570) (busy charles P600)
        (busy charles P660) (busy charles P690) (busy charles P720)
        (busy charles P810) (busy charles P840) (busy charles P870) (busy charles P900)

        ;; --- Betty Busy Constraints (derived from [540, 630), [720, 750), [780, 840), [900, 960)) ---
        (busy betty P540) (busy betty P570) (busy betty P600)
        (busy betty P690) (busy betty P720)
        (busy betty P750) (busy betty P780)
        (busy betty P870) (busy betty P900) (busy betty P930) ; 15:30 start overlaps with 15:00-16:00 end
    )

    (:goal (meeting-scheduled))

    (:metric minimize (total-cost))
)