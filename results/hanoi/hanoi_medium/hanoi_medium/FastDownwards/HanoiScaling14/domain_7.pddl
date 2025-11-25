(define (domain hanoi-five)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place step)

  (:predicates
    (on ?d - disk ?p - place ?s - step)    ; disk ?d is directly on place ?p at step ?s (p can be a peg or a disk)
    (next ?s - step ?s2 - step)            ; successor relation between steps
    (smaller ?d1 - disk ?d2 - disk)        ; d1 is smaller than d2 (static)
  )

  ;; Move disk a onto an empty peg
  (:action move-a-to-peg
    :parameters (?s - step ?s2 - step
                 ?pa ?pb ?pc ?pd ?pe - place
                 ?to - peg)
    :precondition (and
      (next ?s ?s2)
      ;; snapshot of where each disk is at step ?s
      (on a ?pa ?s) (on b ?pb ?s) (on c ?pc ?s) (on d ?pd ?s) (on e ?pe ?s)
      ;; a must be top (no disk on a at step ?s)
      (not (on a a ?s)) (not (on b a ?s)) (not (on c a ?s)) (not (on d a ?s)) (not (on e a ?s))
      ;; destination peg must be empty at step ?s (no disk is on ?to)
      (not (on a ?to ?s)) (not (on b ?to ?s)) (not (on c ?to ?s)) (not (on d ?to ?s)) (not (on e ?to ?s))
      ;; a must currently be located at ?pa (consistency with snapshot)
      (on a ?pa ?s)
    )
    :effect (and
      ;; remove the "on ... at ?s" facts for all disks
      (not (on a ?pa ?s)) (not (on b ?pb ?s)) (not (on c ?pc ?s)) (not (on d ?pd ?s)) (not (on e ?pe ?s))
      ;; add the "on ... at ?s2" facts: a moved to ?to, others retain their places
      (on a ?to ?s2) (on b ?pb ?s2) (on c ?pc ?s2) (on d ?pd ?s2) (on e ?pe ?s2)
    )
  )

  ;; Move disk a onto another disk (must be larger and top)
  (:action move-a-to-disk
    :parameters (?s - step ?s2 - step
                 ?pa ?pb ?pc ?pd ?pe - place
                 ?to - disk)
    :precondition (and
      (next ?s ?s2)
      (on a ?pa ?s) (on b ?pb ?s) (on c ?pc ?s) (on d ?pd ?s) (on e ?pe ?s)
      ;; a must be top
      (not (on a a ?s)) (not (on b a ?s)) (not (on c a ?s)) (not (on d a ?s)) (not (on e a ?s))
      ;; target disk must be top (no disk on ?to at step ?s)
      (not (on a ?to ?s)) (not (on b ?to ?s)) (not (on c ?to ?s)) (not (on d ?to ?s)) (not (on e ?to ?s))
      ;; size ordering: a smaller than destination disk
      (smaller a ?to)
    )
    :effect (and
      (not (on a ?pa ?s)) (not (on b ?pb ?s)) (not (on c ?pc ?s)) (not (on d ?pd ?s)) (not (on e ?pe ?s))
      (on a ?to ?s2) (on b ?pb ?s2) (on c ?pc ?s2) (on d ?pd ?s2) (on e ?pe ?s2)
    )
  )

  ;; Move disk b onto an empty peg
  (:action move-b-to-peg
    :parameters (?s - step ?s2 - step
                 ?pa ?pb ?pc ?pd ?pe - place
                 ?to - peg)
    :precondition (and
      (next ?s ?s2)
      (on a ?pa ?s) (on b ?pb ?s) (on c ?pc ?s) (on d ?pd ?s) (on e ?pe ?s)
      ;; b must be top
      (not (on a b ?s)) (not (on b b ?s)) (not (on c b ?s)) (not (on d b ?s)) (not (on e b ?s))
      ;; destination peg must be empty
      (not (on a ?to ?s)) (not (on b ?to ?s)) (not (on c ?to ?s)) (not (on d ?to ?s)) (not (on e ?to ?s))
    )
    :effect (and
      (not (on a ?pa ?s)) (not (on b ?pb ?s)) (not (on c ?pc ?s)) (not (on d ?pd ?s)) (not (on e ?pe ?s))
      (on a ?pa ?s2) (on b ?to ?s2) (on c ?pc ?s2) (on d ?pd ?s2) (on e ?pe ?s2)
    )
  )

  ;; Move disk b onto another disk
  (:action move-b-to-disk
    :parameters (?s - step ?s2 - step
                 ?pa ?pb ?pc ?pd ?pe - place
                 ?to - disk)
    :precondition (and
      (next ?s ?s2)
      (on a ?pa ?s) (on b ?pb ?s) (on c ?pc ?s) (on d ?pd ?s) (on e ?pe ?s)
      ;; b must be top
      (not (on a b ?s)) (not (on b b ?s)) (not (on c b ?s)) (not (on d b ?s)) (not (on e b ?s))
      ;; destination disk must be top
      (not (on a ?to ?s)) (not (on b ?to ?s)) (not (on c ?to ?s)) (not (on d ?to ?s)) (not (on e ?to ?s))
      ;; size ordering
      (smaller b ?to)
    )
    :effect (and
      (not (on a ?pa ?s)) (not (on b ?pb ?s)) (not (on c ?pc ?s)) (not (on d ?pd ?s)) (not (on e ?pe ?s))
      (on a ?pa ?s2) (on b ?to ?s2) (on c ?pc ?s2) (on d ?pd ?s2) (on e ?pe ?s2)
    )
  )

  ;; Move disk c onto an empty peg
  (:action move-c-to-peg
    :parameters (?s - step ?s2 - step
                 ?pa ?pb ?pc ?pd ?pe - place
                 ?to - peg)
    :precondition (and
      (next ?s ?s2)
      (on a ?pa ?s) (on b ?pb ?s) (on c ?pc ?s) (on d ?pd ?s) (on e ?pe ?s)
      ;; c must be top
      (not (on a c ?s)) (not (on b c ?s)) (not (on c c ?s)) (not (on d c ?s)) (not (on e c ?s))
      ;; destination peg must be empty
      (not (on a ?to ?s)) (not (on b ?to ?s)) (not (on c ?to ?s)) (not (on d ?to ?s)) (not (on e ?to ?s))
    )
    :effect (and
      (not (on a ?pa ?s)) (not (on b ?pb ?s)) (not (on c ?pc ?s)) (not (on d ?pd ?s)) (not (on e ?pe ?s))
      (on a ?pa ?s2) (on b ?pb ?s2) (on c ?to ?s2) (on d ?pd ?s2) (on e ?pe ?s2)
    )
  )

  ;; Move disk c onto another disk
  (:action move-c-to-disk
    :parameters (?s - step ?s2 - step
                 ?pa ?pb ?pc ?pd ?pe - place
                 ?to - disk)
    :precondition (and
      (next ?s ?s2)
      (on a ?pa ?s) (on b ?pb ?s) (on c ?pc ?s) (on d ?pd ?s) (on e ?pe ?s)
      ;; c must be top
      (not (on a c ?s)) (not (on b c ?s)) (not (on c c ?s)) (not (on d c ?s)) (not (on e c ?s))
      ;; destination disk must be top
      (not (on a ?to ?s)) (not (on b ?to ?s)) (not (on c ?to ?s)) (not (on d ?to ?s)) (not (on e ?to ?s))
      ;; size ordering
      (smaller c ?to)
    )
    :effect (and
      (not (on a ?pa ?s)) (not (on b ?pb ?s)) (not (on c ?pc ?s)) (not (on d ?pd ?s)) (not (on e ?pe ?s))
      (on a ?pa ?s2) (on b ?pb ?s2) (on c ?to ?s2) (on d ?pd ?s2) (on e ?pe ?s2)
    )
  )

  ;; Move disk d onto an empty peg
  (:action move-d-to-peg
    :parameters (?s - step ?s2 - step
                 ?pa ?pb ?pc ?pd ?pe - place
                 ?to - peg)
    :precondition (and
      (next ?s ?s2)
      (on a ?pa ?s) (on b ?pb ?s) (on c ?pc ?s) (on d ?pd ?s) (on e ?pe ?s)
      ;; d must be top
      (not (on a d ?s)) (not (on b d ?s)) (not (on c d ?s)) (not (on d d ?s)) (not (on e d ?s))
      ;; destination peg must be empty
      (not (on a ?to ?s)) (not (on b ?to ?s)) (not (on c ?to ?s)) (not (on d ?to ?s)) (not (on e ?to ?s))
    )
    :effect (and
      (not (on a ?pa ?s)) (not (on b ?pb ?s)) (not (on c ?pc ?s)) (not (on d ?pd ?s)) (not (on e ?pe ?s))
      (on a ?pa ?s2) (on b ?pb ?s2) (on c ?pc ?s2) (on d ?to ?s2) (on e ?pe ?s2)
    )
  )

  ;; Move disk d onto another disk
  (:action move-d-to-disk
    :parameters (?s - step ?s2 - step
                 ?pa ?pb ?pc ?pd ?pe - place
                 ?to - disk)
    :precondition (and
      (next ?s ?s2)
      (on a ?pa ?s) (on b ?pb ?s) (on c ?pc ?s) (on d ?pd ?s) (on e ?pe ?s)
      ;; d must be top
      (not (on a d ?s)) (not (on b d ?s)) (not (on c d ?s)) (not (on d d ?s)) (not (on e d ?s))
      ;; destination disk must be top
      (not (on a ?to ?s)) (not (on b ?to ?s)) (not (on c ?to ?s)) (not (on d ?to ?s)) (not (on e ?to ?s))
      ;; size ordering
      (smaller d ?to)
    )
    :effect (and
      (not (on a ?pa ?s)) (not (on b ?pb ?s)) (not (on c ?pc ?s)) (not (on d ?pd ?s)) (not (on e ?pe ?s))
      (on a ?pa ?s2) (on b ?pb ?s2) (on c ?pc ?s2) (on d ?to ?s2) (on e ?pe ?s2)
    )
  )

  ;; Move disk e onto an empty peg
  (:action move-e-to-peg
    :parameters (?s - step ?s2 - step
                 ?pa ?pb ?pc ?pd ?pe - place
                 ?to - peg)
    :precondition (and
      (next ?s ?s2)
      (on a ?pa ?s) (on b ?pb ?s) (on c ?pc ?s) (on d ?pd ?s) (on e ?pe ?s)
      ;; e must be top
      (not (on a e ?s)) (not (on b e ?s)) (not (on c e ?s)) (not (on d e ?s)) (not (on e e ?s))
      ;; destination peg must be empty
      (not (on a ?to ?s)) (not (on b ?to ?s)) (not (on c ?to ?s)) (not (on d ?to ?s)) (not (on e ?to ?s))
    )
    :effect (and
      (not (on a ?pa ?s)) (not (on b ?pb ?s)) (not (on c ?pc ?s)) (not (on d ?pd ?s)) (not (on e ?pe ?s))
      (on a ?pa ?s2) (on b ?pb ?s2) (on c ?pc ?s2) (on d ?pd ?s2) (on e ?to ?s2)
    )
  )

  ;; Move disk e onto another disk
  (:action move-e-to-disk
    :parameters (?s - step ?s2 - step
                 ?pa ?pb ?pc ?pd ?pe - place
                 ?to - disk)
    :precondition (and
      (next ?s ?s2)
      (on a ?pa ?s) (on b ?pb ?s) (on c ?pc ?s) (on d ?pd ?s) (on e ?pe ?s)
      ;; e must be top
      (not (on a e ?s)) (not (on b e ?s)) (not (on c e ?s)) (not (on d e ?s)) (not (on e e ?s))
      ;; destination disk must be top
      (not (on a ?to ?s)) (not (on b ?to ?s)) (not (on c ?to ?s)) (not (on d ?to ?s)) (not (on e ?to ?s))
      ;; size ordering
      (smaller e ?to)
    )
    :effect (and
      (not (on a ?pa ?s)) (not (on b ?pb ?s)) (not (on c ?pc ?s)) (not (on d ?pd ?s)) (not (on e ?pe ?s))
      (on a ?pa ?s2) (on b ?pb ?s2) (on c ?pc ?s2) (on d ?pd ?s2) (on e ?to ?s2)
    )
  )

)