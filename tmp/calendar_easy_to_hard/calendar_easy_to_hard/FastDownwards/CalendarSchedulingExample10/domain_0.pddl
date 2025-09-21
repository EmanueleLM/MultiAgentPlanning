(define (domain integrated-scheduling)
  (:requirements :strips :typing)
  (:types person meeting timeslot)

  (:predicates
    ;; Generic
    (slot ?s - timeslot)
    (meeting ?m - meeting)

    ;; Agent-specific availability / markers (kept distinct per agent)
    (slot-available ?s - timeslot)          ; from Diana's model (agent1)
    (free-diana ?s - timeslot)              ; Diana is free at slot
    (available-ethan ?s - timeslot)         ; Ethan is available at slot
    (free-janet ?s - timeslot)              ; Janet is free at slot

    ;; Janet's preferences / window (agent3)
    (preferred-janet ?s - timeslot)
    (within-window ?s - timeslot)
    (can-schedule-janet)

    ;; Reservations / readiness (kept distinct per agent)
    (diana-reserved ?m - meeting ?s - timeslot)
    (ethan-reserved ?m - meeting ?s - timeslot)
    (janet-reserved ?m - meeting ?s - timeslot)

    ;; Final outcome
    (meeting-scheduled ?m - meeting ?s - timeslot)
  )

  ;; Actions kept distinct per original agents (names prefixed by agent)
  ;; Diana's scheduling-like action (based on agent1)
  (:action diana_reserve
    :parameters (?m - meeting ?s - timeslot)
    :precondition (and (meeting ?m) (slot ?s) (free-diana ?s) (slot-available ?s))
    :effect (and
              (diana-reserved ?m ?s)
              (not (free-diana ?s))
              (not (slot-available ?s))
            )
  )

  ;; Ethan's reserve action (based on agent2)
  (:action ethan_reserve
    :parameters (?m - meeting ?s - timeslot)
    :precondition (and (meeting ?m) (slot ?s) (available-ethan ?s))
    :effect (and
              (ethan-reserved ?m ?s)
              (not (available-ethan ?s))
            )
  )

  ;; Janet's scheduling/reservation action (based on agent3, kept distinct)
  (:action janet_reserve
    :parameters (?m - meeting ?s - timeslot)
    :precondition (and
                    (meeting ?m)
                    (slot ?s)
                    (within-window ?s)
                    (preferred-janet ?s)
                    (free-janet ?s)
                    (can-schedule-janet)
                  )
    :effect (and
              (janet-reserved ?m ?s)
              (not (free-janet ?s))
              (not (can-schedule-janet))
            )
  )

  ;; Coordinator / finalizer action: only schedules the global meeting when all agents
  ;; have reserved the same slot. This ensures the meeting fits all participants' availability.
  (:action finalize_meeting
    :parameters (?m - meeting ?s - timeslot)
    :precondition (and
                    (meeting ?m)
                    (slot ?s)
                    (diana-reserved ?m ?s)
                    (ethan-reserved ?m ?s)
                    (janet-reserved ?m ?s)
                  )
    :effect (and
              (meeting-scheduled ?m ?s)
            )
  )
)