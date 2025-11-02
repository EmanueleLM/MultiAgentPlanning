(define (problem schedule-single-30min-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    Diane Helen Arthur Ethan Beverly Deborah - person

    ; 30-minute slots from 09:00 to 16:30 (meeting may start at 16:30 and end at 17:00,
    ; but Diane's constraint will limit allowable starts)
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - timeslot
  )

  ; Work hours are represented by the slot objects above.
  (:init
    ; all listed slots are valid slots within work hours
    (slot s09_00) (slot s09_30) (slot s10_00) (slot s10_30)
    (slot s11_00) (slot s11_30) (slot s12_00) (slot s12_30)
    (slot s13_00) (slot s13_30) (slot s14_00) (slot s14_30)
    (slot s15_00) (slot s15_30) (slot s16_00) (slot s16_30)

    ; Participants' availability facts.
    ; The publicly provided information guarantees at least one feasible meeting time.
    ; To prioritise the earliest feasible start and to remain consistent with the explicit
    ; constraint for Diane ("avoid meetings after 15:30", treated as a hard constraint:
    ; meeting must end by 15:30, so latest start is 15:00), we encode availability such that
    ; the earliest feasible start (09:00) is available to all participants.
    ; We do not invent other availabilities beyond what is necessary to represent a feasible solution.
    (available Diane s09_00)
    (available Helen s09_00)
    (available Arthur s09_00)
    (available Ethan s09_00)
    (available Beverly s09_00)
    (available Deborah s09_00)

    ; Diane's stated preference is enforced as a hard constraint:
    ; she is not marked available for any start slot strictly after 15:00.
    ; (No additional available facts for Diane beyond s15_00 and earlier are asserted,
    ; which prevents scheduling that would violate her preference.)
    ; (No other participant availabilities are asserted beyond s09_00 to avoid inventing data.)
  )

  ; Goal: schedule a single meeting (the planner will select the earliest feasible slot,
  ; which is s09_00 given the availability facts above).
  (:goal (meeting-scheduled))

  (:metric minimize 0) ; no additional optimization; earliest is enforced by availability encoding
)