(define (domain meeting-scheduler-multi-agent)
  (:requirements :typing)
  (:types person slot)
  (:constants
    brian patricia billy - person
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )
  (:predicates
    (attendee ?p - person)
    (available ?p - person ?t - slot)
    (slot_free ?t - slot)
    (meeting_scheduled_at ?t - slot)
  )
  ; Action: scheduling by Brian (planner)
  (:action schedule-meeting-by-brian
    :parameters (?t - slot)
    :precondition (and
                   (slot_free ?t)
                   (available brian ?t)
                   (attendee billy)
                   (attendee patricia))
    :effect (and
              (not (slot_free ?t))
              (meeting_scheduled_at ?t))
  )
  ; Action: scheduling by Billy
  (:action schedule-meeting-by-billy
    :parameters (?t - slot)
    :precondition (and
                   (slot_free ?t)
                   (available billy ?t)
                   (attendee brian)
                   (attendee patricia))
    :effect (and
              (not (slot_free ?t))
              (meeting_scheduled_at ?t))
  )
  ; Action: scheduling by Patricia
  (:action schedule-meeting-by-patricia
    :parameters (?t - slot)
    :precondition (and
                   (slot_free ?t)
                   (available patricia ?t)
                   (attendee brian)
                   (attendee billy))
    :effect (and
              (not (slot_free ?t))
              (meeting_scheduled_at ?t))
  )
)