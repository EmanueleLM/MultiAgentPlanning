(define (domain integrated-scheduling)
  (:requirements :strips :typing)
  (:types person meeting timeslot)

  (:predicates
    (slot ?s - timeslot)
    (is-meeting ?m - meeting)
    (slot-available ?s - timeslot)
    (free-diana ?s - timeslot)
    (available-ethan ?s - timeslot)
    (free-janet ?s - timeslot)
    (preferred-janet ?s - timeslot)
    (within-window ?s - timeslot)
    (can-schedule-janet)
    (diana-reserved ?m - meeting ?s - timeslot)
    (ethan-reserved ?m - meeting ?s - timeslot)
    (janet-reserved ?m - meeting ?s - timeslot)
    (meeting-scheduled ?m - meeting ?s - timeslot)
  )

  (:action diana_reserve
    :parameters (?m - meeting ?s - timeslot)
    :precondition (and (is-meeting ?m) (slot ?s) (free-diana ?s) (slot-available ?s))
    :effect (and
              (diana-reserved ?m ?s)
              (not (free-diana ?s))
              (not (slot-available ?s))
            )
  )

  (:action ethan_reserve
    :parameters (?m - meeting ?s - timeslot)
    :precondition (and (is-meeting ?m) (slot ?s) (available-ethan ?s))
    :effect (and
              (ethan-reserved ?m ?s)
              (not (available-ethan ?s))
            )
  )

  (:action janet_reserve
    :parameters (?m - meeting ?s - timeslot)
    :precondition (and
                    (is-meeting ?m)
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

  (:action finalize_meeting
    :parameters (?m - meeting ?s - timeslot)
    :precondition (and
                    (is-meeting ?m)
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