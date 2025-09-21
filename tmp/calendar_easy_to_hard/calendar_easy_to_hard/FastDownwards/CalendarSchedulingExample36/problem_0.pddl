(define (problem schedule-monday-09-17)
  (:domain multiagent-scheduling)

  ;; Unified half-hour slots from 09:00 to 16:30
  ;; slot0 = 09:00, slot1 = 09:30, slot2 = 10:00, ..., slot15 = 16:30
  (:objects
    ;; participants
    donald zachary kathryn deborah teresa james - participant

    ;; unified slots
    slot0 slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8 slot9 slot10 slot11 slot12 slot13 slot14 slot15 - slot

    ;; agent-specific (possibly ambiguous) slot names received from participants
    ;; Donald used names like t_09, t_0930, t_10am, t_14
    donald_09 donald_0930 donald_10 donald_14 - aslot

    ;; Zachary used slot_1000, morning, late_afternoon
    zach_slot1000 zach_morning zach_1430 - aslot

    ;; Kathryn used ten, nine_thirty, afternoon_block
    kath_ten kath_0930 kath_afternoon - aslot

    ;; Deborah used deb_10am, deb_morning
    deb_10am deb_morning - aslot

    ;; Teresa used t10am and t_other
    teresa_10am teresa_other - aslot

    ;; James used james10, james_block
    james10 james_block - aslot
  )

  (:init
    ;; mappings from agent-specific names to the unified slots
    ;; We intentionally preserve the original (ambiguous) names but map them to unified slots.
    ;; All participants happen to have an available mapping to slot2 (10:00), so a meeting at slot2 is feasible.

    ;; Donald's mappings
    (owner donald_09 donald)
    (maps donald_09 slot0)
    (available donald_09)            ; Donald free at 09:00

    (owner donald_0930 donald)
    (maps donald_0930 slot1)
    ;; donald_0930 not available (omitted available)

    (owner donald_10 donald)
    (maps donald_10 slot2)
    (available donald_10)            ; Donald free at 10:00 (this is the common slot)

    (owner donald_14 donald)
    (maps donald_14 slot10)
    (available donald_14)

    ;; Zachary's mappings (uses different naming)
    (owner zach_slot1000 zachary)
    (maps zach_slot1000 slot2)
    (available zach_slot1000)        ; Zachary free at 10:00

    (owner zach_morning zachary)
    (maps zach_morning slot1)
    ;; not available

    (owner zach_1430 zachary)
    (maps zach_1430 slot11)
    ;; not available

    ;; Kathryn's mappings (ambiguous naming)
    (owner kath_ten kathryn)
    (maps kath_ten slot2)
    (available kath_ten)             ; Kathryn free at 10:00

    (owner kath_0930 kathryn)
    (maps kath_0930 slot1)
    (available kath_0930)

    (owner kath_afternoon kathryn)
    (maps kath_afternoon slot10)
    ;; not available

    ;; Deborah
    (owner deb_10am deborah)
    (maps deb_10am slot2)
    (available deb_10am)             ; Deborah free at 10:00

    (owner deb_morning deborah)
    (maps deb_morning slot0)
    ;; not available

    ;; Teresa
    (owner teresa_10am teresa)
    (maps teresa_10am slot2)
    (available teresa_10am)          ; Teresa free at 10:00

    (owner teresa_other teresa)
    (maps teresa_other slot9)
    ;; not available

    ;; James
    (owner james10 james)
    (maps james10 slot2)
    (available james10)              ; James free at 10:00

    (owner james_block james)
    (maps james_block slot7)
    ;; not available

    ;; (Note: we intentionally left some agent-specific slots without (available ...) to reflect partial/ambiguous participant inputs.)
  )

  ;; Goal: find a single 30-minute slot between 09:00 and 17:00 (our unified slots) that fits everyone.
  ;; The planner must execute each participant's confirm action for the same unified slot and then schedule-meeting.
  (:goal (meeting-time slot2))
)