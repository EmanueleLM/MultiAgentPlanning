(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent slot)
  (:predicates
    (next ?s1 - slot ?s2 - slot)           ; adjacency of 30-min slots
    (busy ?a - agent ?s - slot)           ; agent is unavailable at slot
    (scheduled ?s1 - slot ?s2 - slot)     ; meeting scheduled occupying two slots
    (meeting-scheduled)                   ; global flag that meeting has been scheduled
  )

  ;; A single parameterized scheduling action that requires two consecutive slots
  ;; and that each participant is not busy in both slots. Effects mark the meeting
  ;; scheduled and mark those slots busy for all participants to prevent further scheduling.
  (:action schedule
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (not (meeting-scheduled))
      ;; hard constraints: none of the participants are busy in either slot
      (not (busy michelle ?s1)) (not (busy michelle ?s2))
      (not (busy steven   ?s1)) (not (busy steven   ?s2))
      (not (busy jerry    ?s1)) (not (busy jerry    ?s2))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled ?s1 ?s2)
      ;; mark those slots busy for all participants (keeps agents distinct)
      (busy michelle ?s1) (busy michelle ?s2)
      (busy steven   ?s1) (busy steven   ?s2)
      (busy jerry    ?s1) (busy jerry    ?s2)
    )
  )
)