(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :equality)
  (:types person slot)
  (:predicates
    (available ?p - person ?s - slot)
    (attends ?p - person ?s - slot)
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )

  (:action attend
    :parameters (?p - person ?s - slot)
    :precondition (and (available ?p ?s) (not (meeting-scheduled)) (not (attends ?p ?s)))
    :effect (attends ?p ?s)
  )

  (:action finalize-meeting
    :parameters (?s - slot ?a - person ?b - person ?c - person ?d - person ?e - person ?f - person ?g - person)
    :precondition (and
      (not (meeting-scheduled))
      (attends ?a ?s) (attends ?b ?s) (attends ?c ?s) (attends ?d ?s) (attends ?e ?s) (attends ?f ?s) (attends ?g ?s)
      (not (= ?a ?b)) (not (= ?a ?c)) (not (= ?a ?d)) (not (= ?a ?e)) (not (= ?a ?f)) (not (= ?a ?g))
      (not (= ?b ?c)) (not (= ?b ?d)) (not (= ?b ?e)) (not (= ?b ?f)) (not (= ?b ?g))
      (not (= ?c ?d)) (not (= ?c ?e)) (not (= ?c ?f)) (not (= ?c ?g))
      (not (= ?d ?e)) (not (= ?d ?f)) (not (= ?d ?g))
      (not (= ?e ?f)) (not (= ?e ?g))
      (not (= ?f ?g))
    )
    :effect (and (meeting-scheduled) (scheduled-at ?s))
  )
)