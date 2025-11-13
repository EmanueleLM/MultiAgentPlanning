(define (domain hanoi-agents)
  (:requirements :strips :typing)
  (:types disk peg agent)
  (:predicates
    (on ?d - disk ?x - disk)
    (on-peg ?d - disk ?p - peg)
    (clear ?d - disk)
    (clear-peg ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
    (can-move ?a - agent ?d - disk)
  )

  (:action move-from-peg-to-peg
    :parameters (?a - agent ?d - disk ?p1 - peg ?p2 - peg)
    :precondition (and
      (can-move ?a ?d)
      (on-peg ?d ?p1)
      (clear ?d)
      (clear-peg ?p2))
    :effect (and
      (not (on-peg ?d ?p1))
      (on-peg ?d ?p2)
      (clear-peg ?p1)
      (not (clear-peg ?p2))))
  
  (:action move-from-peg-to-disk
    :parameters (?a - agent ?d - disk ?p - peg ?t - disk)
    :precondition (and
      (can-move ?a ?d)
      (on-peg ?d ?p)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t))
    :effect (and
      (not (on-peg ?d ?p))
      (on ?d ?t)
      (clear-peg ?p)
      (not (clear ?t))))
  
  (:action move-from-disk-to-peg
    :parameters (?a - agent ?d - disk ?b - disk ?p - peg)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?b)
      (clear ?d)
      (clear-peg ?p))
    :effect (and
      (not (on ?d ?b))
      (clear ?b)
      (on-peg ?d ?p)
      (not (clear-peg ?p))))
  
  (:action move-from-disk-to-disk
    :parameters (?a - agent ?d - disk ?b - disk ?t - disk)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?b)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t))
    :effect (and
      (not (on ?d ?b))
      (clear ?b)
      (on ?d ?t)
      (not (clear ?t))))
)