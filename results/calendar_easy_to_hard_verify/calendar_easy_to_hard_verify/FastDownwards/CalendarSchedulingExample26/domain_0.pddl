(define (domain scheduling-multiagent)
  (:requirements :strips :typing :negative-preconditions :quantified-preconditions :conditional-effects :adl)
  (:types agent slot meeting)

  (:predicates
    (agent ?a - agent)
    (slot ?s - slot)
    ;; available ?a ?s = participant ?a is available for a 30-min meeting that starts at slot ?s
    (available ?a - agent ?s - slot)
    ;; scheduled ?s = a meeting has been scheduled at slot ?s
    (scheduled ?s - slot)
    ;; meeting-at ?m ?s = meeting ?m is scheduled at slot ?s
    (meeting-at ?m - meeting ?s - slot)
    ;; attends ?a ?m = participant ?a will attend meeting ?m
    (attends ?a - agent ?m - meeting)
  )

  ;; Single action to schedule a 30-minute meeting (a meeting is a single slot).
  ;; Preconditions: slot not scheduled and every declared agent is available at that slot.
  ;; Effects: mark slot scheduled, create meeting-at, each agent attends meeting, and mark those agents unavailable at that slot (so slot cannot be reused).
  (:action schedule-meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (slot ?s)
      (not (scheduled ?s))
      ;; require that all agents that appear in the problem are available at ?s
      (forall (?a - agent) (available ?a ?s))
    )
    :effect (and
      (scheduled ?s)
      (meeting-at ?m ?s)
      ;; every agent attends the meeting
      (forall (?a - agent) (attends ?a ?m))
      ;; mark those agents not available at that slot anymore (represents consuming that slot)
      (forall (?a - agent) (not (available ?a ?s)))
    )
  )
)