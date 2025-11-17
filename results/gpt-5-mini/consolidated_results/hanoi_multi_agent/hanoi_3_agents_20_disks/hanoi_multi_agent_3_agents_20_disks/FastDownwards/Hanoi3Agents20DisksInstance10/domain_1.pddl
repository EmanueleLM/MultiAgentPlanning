(define (domain hanoi-3agents-20disks)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj disk peg agent)

  ;; Predicates:
  ;; (on ?d ?b) : disk ?d is directly on object ?b (object = disk or peg)
  ;; (clear ?o) : object ?o (disk or peg) currently has nothing on top of it
  ;; (can-move ?a ?d) : agent ?a is permitted to move disk ?d
  ;; (bigger ?x ?y) : object ?x (disk or peg) is strictly larger than disk ?y
  (:predicates
    (on ?d - disk ?b - obj)
    (clear ?o - obj)
    (can-move ?a - agent ?d - disk)
    (bigger ?x - obj ?y - disk)
  )

  ;; Generic move action: an agent moves a clear disk that is on some object,
  ;; onto another object that is clear and strictly larger than the moving disk.
  (:action move
    :parameters (?a - agent ?d - disk ?from - obj ?to - obj)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (bigger ?to ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )
)