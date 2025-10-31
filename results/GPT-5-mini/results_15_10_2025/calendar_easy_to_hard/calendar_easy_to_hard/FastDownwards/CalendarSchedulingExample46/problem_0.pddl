(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  ; NOTE:
  ; - This is a template problem for Monday between 09:00 and 17:00 using 30-minute discrete slots.
  ; - There are 16 slots: slot-0 = 09:00-09:30, slot-1 = 09:30-10:00, ..., slot-15 = 16:30-17:00.
  ; - You MUST supply the actual participant objects and the (free <participant> <slot>) facts
  ;   according to the availability profiles you have.
  ; - Preferences described in natural language must be expressed as (free ...) facts here;
  ;   they are treated as hard constraints. No unavailable slot should be marked free.
  ; - The planner will minimize total-cost to pick the earliest feasible slot.

  (:objects
    slot-0 slot-1 slot-2 slot-3 slot-4 slot-5 slot-6 slot-7
    slot-8 slot-9 slot-10 slot-11 slot-12 slot-13 slot-14 slot-15 - slot

    ; Replace or extend the following participants with the actual participant names:
    ; e.g. alice bob carol - participant
    ; For now no participants are declared. Add participants below and corresponding (free ...) facts in :init.
  )

  (:init
    ; Declare the 16 slots
    (slot slot-0)  (slot slot-1)  (slot slot-2)  (slot slot-3)
    (slot slot-4)  (slot slot-5)  (slot slot-6)  (slot slot-7)
    (slot slot-8)  (slot slot-9)  (slot slot-10) (slot slot-11)
    (slot slot-12) (slot slot-13) (slot slot-14) (slot slot-15)

    ; Initialize numeric objective
    (= (total-cost) 0)

    ; Slot costs: earlier slots have smaller costs so minimizing total-cost selects the earliest feasible slot
    (= (slot-cost slot-0) 0)
    (= (slot-cost slot-1) 1)
    (= (slot-cost slot-2) 2)
    (= (slot-cost slot-3) 3)
    (= (slot-cost slot-4) 4)
    (= (slot-cost slot-5) 5)
    (= (slot-cost slot-6) 6)
    (= (slot-cost slot-7) 7)
    (= (slot-cost slot-8) 8)
    (= (slot-cost slot-9) 9)
    (= (slot-cost slot-10) 10)
    (= (slot-cost slot-11) 11)
    (= (slot-cost slot-12) 12)
    (= (slot-cost slot-13) 13)
    (= (slot-cost slot-14) 14)
    (= (slot-cost slot-15) 15)

    ; ---------------------------
    ; ADD AVAILABILITIES HERE:
    ; For each participant p and each 30-min slot s when p is available, add:
    ;   (free p s)
    ; Also declare participants in the :objects section (comma-separated) and mark them with type - participant.
    ;
    ; Example (if participants alice and bob are available in slot-0 and slot-1):
    ;   ; in :objects:  alice bob - participant
    ;   ; in :init:
    ;   (free alice slot-0)
    ;   (free alice slot-1)
    ;   (free bob   slot-0)
    ;   (free bob   slot-1)
    ;
    ; The planner will only consider slots for which every declared participant has a (free ...) fact.
    ; ---------------------------

    ; No (scheduled) fact is declared here initially; its absence means no meeting yet.
  )

  (:goal
    (scheduled)
  )
)