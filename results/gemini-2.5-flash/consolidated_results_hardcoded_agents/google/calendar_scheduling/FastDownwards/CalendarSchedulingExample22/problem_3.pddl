(define (problem schedule-earliest-common-slot)
    (:domain calendar-scheduling-integration)
    (:objects
        THERESA CHARLES BETTY - agent
        P540 P570 P600 P630 P660 P690 P720 P750 P780 P810 P840 P870 P900 P930 P960 - time-point
    )

    (:init
        (= (total-cost) 0)

        ;; Define numerical values (minutes, 9:00=540 to 16:00=960)
        (= (time-value P540) 540) (= (time-value P570) 570) (= (time-value P600) 600) 
        (= (time-value P630) 630) (= (time-value P660) 660) (= (time-value P690) 690) 
        (= (time-value P720) 720) (= (time-value P750) 750) (= (time-value P780) 780) 
        (= (time-value P810) 810) (= (time-value P840) 840) (= (time-value P870) 870) 
        (= (time-value P900) 900) (= (time-value P930) 930) (= (time-value P960) 960)

        ;; Define valid start times (9:00 to 16:00, allowing 1 hour meeting ending by 17:00)
        (is-start-time P540) (is-start-time P570) (is-start-time P600) (is-start-time P630) 
        (is-start-time P660) (is-start-time P690) (is-start-time P720) (is-start-time P750) 
        (is-start-time P780) (is-start-time P810) (is-start-time P840) (is-start-time P870) 
        (is-start-time P900) (is-start-time P930) (is-start-time P960) 

        ;; --- Busy Constraints for 1-hour slot [T, T+60) ---

        ;; THERESA Busy: 9:00-9:30, 12:30-13:30, 14:00-15:00, 16:30-17:00.
        ;; Blocked Starts: P540, P720, P750, P780, P810, P840, P930, P960.
        (busy THERESA P540) 
        (busy THERESA P720) (busy THERESA P750) (busy THERESA P780) 
        (busy THERESA P810) (busy THERESA P840) 
        (busy THERESA P930) (busy THERESA P960)

        ;; CHARLES Busy: 10:00-10:30, 11:30-12:30, 14:00-15:30.
        ;; Blocked Starts: P570, P600, P660, P690, P720, P810, P840, P870, P900.
        (busy CHARLES P570) (busy CHARLES P600)
        (busy CHARLES P660) (busy CHARLES P690) (busy CHARLES P720)
        (busy CHARLES P810) (busy CHARLES P840) (busy CHARLES P870) (busy CHARLES P900)

        ;; BETTY Busy: 9:00-10:30, 12:00-12:30, 13:00-14:00, 15:00-16:00.
        ;; Blocked Starts: P540, P570, P600, P690, P720, P750, P780, P810, P870, P900, P930. 
        (busy BETTY P540) (busy BETTY P570) (busy BETTY P600)
        (busy BETTY P690) (busy BETTY P720)
        (busy BETTY P750) (busy BETTY P780) (busy BETTY P810)
        (busy BETTY P870) (busy BETTY P900) (busy BETTY P930)
    )

    (:goal (meeting-scheduled))

    (:metric minimize (total-cost))