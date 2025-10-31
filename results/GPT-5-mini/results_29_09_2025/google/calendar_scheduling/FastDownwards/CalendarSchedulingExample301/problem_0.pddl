(define (problem schedule-monday-09-17)
  (:domain meeting-scheduling)

  ;; Objects: fill participant names (no inventing). Slots enumerated for Monday 09:00-17:00 in 30-min increments.
  (:objects
    ; --- PARTICIPANTS: replace the example names or add your real participant IDs ---
    ; Example placeholder (replace these with actual participant constants):
    ; alice bob carol - participant

    ; --- TIME SLOTS (Monday 09:00-17:00, 30-minute granularity) ---
    slot-09-00 slot-09-30 slot-10-00 slot-10-30
    slot-11-00 slot-11-30 slot-12-00 slot-12-30
    slot-13-00 slot-13-30 slot-14-00 slot-14-30
    slot-15-00 slot-15-30 slot-16-00 slot-16-30 - slot
  )

  (:init
    ; --- AVAILABILITIES: list facts of the form (available <participant> <slot>) ---
    ; Example:
    ; (available alice slot-09-00)
    ; (available alice slot-09-30)
    ; (available bob   slot-09-30)
    ; (available carol slot-09-30)
    ;
    ; IMPORTANT: Do not add any (available ...) facts for slots participants are NOT available for.
    ; Treat natural-language preferences as hard constraints.
  )

  ;; GOAL:
  ;; Constrain the planner to pick one slot where:
  ;; - every participant has an (attended participant slot) fact (ensured by planner applying attend actions),
  ;; - and the chosen slot is marked (meeting-scheduled slot) (ensured by applying schedule action).
  ;;
  ;; To build the concrete goal, list attended facts for every participant and the meeting-scheduled
  ;; fact for the same slot. Example goal for participants alice, bob, carol at slot-09-30:
  ;; (and (attended alice slot-09-30) (attended bob slot-09-30) (attended carol slot-09-30)
  ;;      (meeting-scheduled slot-09-30))
  ;;
  ;; The planner will find a plan that applies attend for each participant at the same slot
  ;; (only possible if all those (available ...) facts exist) and then schedule that slot.
  (:goal
    (and
      ; --- Replace the example below with a conjunction of (attended <each-participant> <same-slot>)
      ; and (meeting-scheduled <same-slot>), using the earliest compatible slot you want the planner
      ; to consider. Example placeholder (replace with concrete attended facts):
      ; (attended alice slot-09-30)
      ; (attended bob   slot-09-30)
      ; (attended carol slot-09-30)
      ; (meeting-scheduled slot-09-30)
    )
  )
)