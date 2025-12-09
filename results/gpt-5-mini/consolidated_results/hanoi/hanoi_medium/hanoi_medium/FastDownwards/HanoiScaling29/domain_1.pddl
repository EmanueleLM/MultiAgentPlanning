(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place stage)

  (:predicates
    (on ?d - disk ?p - place)         ; disk ?d is directly on place ?p (place = disk or peg)
    (clear ?p - place)               ; nothing is on top of place ?p
    (smaller ?d1 - disk ?d2 - disk)  ; ?d1 is strictly smaller than ?d2
    (at-stage ?s - stage)            ; current planning stage
    (next ?s1 - stage ?s2 - stage)   ; immediate successor relation between stages
  )

  ;; Move a top disk from a place onto an empty peg, advancing to the successor stage.
  (:action move-to-peg
    :parameters (?d - disk ?src - place ?dst - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?src)
      (clear ?d)
      (clear ?dst)
      (not (= ?src ?dst))
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?dst)
      (clear ?src)
      (not (clear ?dst))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk from a place onto the top of a strictly larger disk, advancing to the successor stage.
  (:action move-to-disk
    :parameters (?d - disk ?src - place ?dst - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?src)
      (clear ?d)
      (clear ?dst)
      (smaller ?d ?dst)
      (not (= ?src ?dst))
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?dst)
      (clear ?src)
      (not (clear ?dst))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)