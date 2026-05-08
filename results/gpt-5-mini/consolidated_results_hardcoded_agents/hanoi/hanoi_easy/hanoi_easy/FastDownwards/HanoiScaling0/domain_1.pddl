(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)
  (:predicates
    (on ?d - disk ?p - peg ?s - stage)   ; disk ?d is on peg ?p at stage ?s
    (at-stage ?s - stage)               ; current stage pointer
    (succ ?s1 - stage ?s2 - stage)      ; successor relation between stages
  )

  ;; Disk A (smallest) moves: no smaller disk checks required
  (:action move-A-left-middle
    :parameters (?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (succ ?s ?s2) (on A left ?s))
    :effect (and (not (at-stage ?s)) (at-stage ?s2) (not (on A left ?s)) (on A middle ?s2))
  )

  (:action move-A-left-right
    :parameters (?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (succ ?s ?s2) (on A left ?s))
    :effect (and (not (at-stage ?s)) (at-stage ?s2) (not (on A left ?s)) (on A right ?s2))
  )

  (:action move-A-middle-left
    :parameters (?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (succ ?s ?s2) (on A middle ?s))
    :effect (and (not (at-stage ?s)) (at-stage ?s2) (not (on A middle ?s)) (on A left ?s2))
  )

  (:action move-A-middle-right
    :parameters (?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (succ ?s ?s2) (on A middle ?s))
    :effect (and (not (at-stage ?s)) (at-stage ?s2) (not (on A middle ?s)) (on A right ?s2))
  )

  (:action move-A-right-left
    :parameters (?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (succ ?s ?s2) (on A right ?s))
    :effect (and (not (at-stage ?s)) (at-stage ?s2) (not (on A right ?s)) (on A left ?s2))
  )

  (:action move-A-right-middle
    :parameters (?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (succ ?s ?s2) (on A right ?s))
    :effect (and (not (at-stage ?s)) (at-stage ?s2) (not (on A right ?s)) (on A middle ?s2))
  )

  ;; Disk B moves: A is smaller than B, so A must not be on source or destination
  (:action move-B-left-middle
    :parameters (?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (succ ?s ?s2) (on B left ?s) (not (on A left ?s)) (not (on A middle ?s)))
    :effect (and (not (at-stage ?s)) (at-stage ?s2) (not (on B left ?s)) (on B middle ?s2))
  )

  (:action move-B-left-right
    :parameters (?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (succ ?s ?s2) (on B left ?s) (not (on A left ?s)) (not (on A right ?s)))
    :effect (and (not (at-stage ?s)) (at-stage ?s2) (not (on B left ?s)) (on B right ?s2))
  )

  (:action move-B-middle-left
    :parameters (?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (succ ?s ?s2) (on B middle ?s) (not (on A middle ?s)) (not (on A left ?s)))
    :effect (and (not (at-stage ?s)) (at-stage ?s2) (not (on B middle ?s)) (on B left ?s2))
  )

  (:action move-B-middle-right
    :parameters (?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (succ ?s ?s2) (on B middle ?s) (not (on A middle ?s)) (not (on A right ?s)))
    :effect (and (not (at-stage ?s)) (at-stage ?s2) (not (on B middle ?s)) (on B right ?s2))
  )

  (:action move-B-right-left
    :parameters (?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (succ ?s ?s2) (on B right ?s) (not (on A right ?s)) (not (on A left ?s)))
    :effect (and (not (at-stage ?s)) (at-stage ?s2) (not (on B right ?s)) (on B left ?s2))
  )

  (:action move-B-right-middle
    :parameters (?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (succ ?s ?s2) (on B right ?s) (not (on A right ?s)) (not (on A middle ?s)))
    :effect (and (not (at-stage ?s)) (at-stage ?s2) (not (on B right ?s)) (on B middle ?s2))
  )

  ;; Disk C moves: A and B are smaller than C
  (:action move-C-left-middle
    :parameters (?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (succ ?s ?s2) (on C left ?s)
                       (not (on A left ?s)) (not (on B left ?s))
                       (not (on A middle ?s)) (not (on B middle ?s)))
    :effect (and (not (at-stage ?s)) (at-stage ?s2) (not (on C left ?s)) (on C middle ?s2))
  )

  (:action move-C-left-right
    :parameters (?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (succ ?s ?s2) (on C left ?s)
                       (not (on A left ?s)) (not (on B left ?s))
                       (not (on A right ?s)) (not (on B right ?s)))
    :effect (and (not (at-stage ?s)) (at-stage ?s2) (not (on C left ?s)) (on C right ?s2))
  )

  (:action move-C-middle-left
    :parameters (?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (succ ?s ?s2) (on C middle ?s)
                       (not (on A middle ?s)) (not (on B middle ?s))
                       (not (on A left ?s)) (not (on B left ?s)))
    :effect (and (not (at-stage ?s)) (at-stage ?s2) (not (on C middle ?s)) (on C left ?s2))
  )

  (:action move-C-middle-right
    :parameters (?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (succ ?s ?s2) (on C middle ?s)
                       (not (on A middle ?s)) (not (on B middle ?s))
                       (not (on A right ?s)) (not (on B right ?s)))
    :effect (and (not (at-stage ?s)) (at-stage ?s2) (not (on C middle ?s)) (on C right ?s2))
  )

  (:action move-C-right-left
    :parameters (?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (succ ?s ?s2) (on C right ?s)
                       (not (on A right ?s)) (not (on B right ?s))
                       (not (on A left ?s)) (not (on B left ?s)))
    :effect (and (not (at-stage ?s)) (at-stage ?s2) (not (on C right ?s)) (on C left ?s2))
  )

  (:action move-C-right-middle
    :parameters (?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (succ ?s ?s2) (on C right ?s)
                       (not (on A right ?s)) (not (on B right ?s))
                       (not (on A middle ?s)) (not (on B middle ?s)))
    :effect (and (not (at-stage ?s)) (at-stage ?s2) (not (on C right ?s)) (on C middle ?s2))
  )

  ;; Disk D moves: A, B, C are smaller
  (:action move-D-left-middle
    :parameters (?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (succ ?s ?s2) (on D left ?s)
                       (not (on A left ?s)) (not (on B left ?s)) (not (on C left ?s))
                       (not (on A middle ?s)) (not (on B middle ?s)) (not (on C middle ?s)))
    :effect (and (not (at-stage ?s)) (at-stage ?s2) (not (on D left ?s)) (on D middle ?s2))
  )

  (:action move-D-left-right
    :parameters (?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (succ ?s ?s2) (on D left ?s)
                       (not (on A left ?s)) (not (on B left ?s)) (not (on C left ?s))
                       (not (on A right ?s)) (not (on B right ?s)) (not (on C right ?s)))
    :effect (and (not (at-stage ?s)) (at-stage ?s2) (not (on D left ?s)) (on D right ?s2))
  )

  (:action move-D-middle-left
    :parameters (?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (succ ?s ?s2) (on D middle ?s)
                       (not (on A middle ?s)) (not (on B middle ?s)) (not (on C middle ?s))
                       (not (on A left ?s)) (not (on B left ?s)) (not (on C left ?s)))
    :effect (and (not (at-stage ?s)) (at-stage ?s2) (not (on D middle ?s)) (on D left ?s2))
  )

  (:action move-D-middle-right
    :parameters (?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (succ ?s ?s2) (on D middle ?s)
                       (not (on A middle ?s)) (not (on B middle ?s)) (not (on C middle ?s))
                       (not (on A right ?s)) (not (on B right ?s)) (not (on C right ?s)))
    :effect (and (not (at-stage ?s)) (at-stage ?s2) (not (on D middle ?s)) (on D right ?s2))
  )

  (:action move-D-right-left
    :parameters (?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (succ ?s ?s2) (on D right ?s)
                       (not (on A right ?s)) (not (on B right ?s)) (not (on C right ?s))
                       (not (on A left ?s)) (not (on B left ?s)) (not (on C left ?s)))
    :effect (and (not (at-stage ?s)) (at-stage ?s2) (not (on D right ?s)) (on D left ?s2))
  )

  (:action move-D-right-middle
    :parameters (?s - stage ?s2 - stage)
    :precondition (and (at-stage ?s) (succ ?s ?s2) (on D right ?s)
                       (not (on A right ?s)) (not (on B right ?s)) (not (on C right ?s))
                       (not (on A middle ?s)) (not (on B middle ?s)) (not (on C middle ?s)))
    :effect (and (not (at-stage ?s)) (at-stage ?s2) (not (on D right ?s)) (on D middle ?s2))
  )
)