(define (domain hanoi-five)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place step)

  (:predicates
    (on ?d - disk ?p - place ?s - step)    ; disk ?d is directly on placeable ?p at step ?s
    (next ?s - step ?s2 - step)            ; successor relation between steps
    (smaller ?d1 - disk ?d2 - disk)        ; d1 is smaller than d2 (static)
  )

  ;; Move disk a onto an empty peg
  (:action move-a-to-peg
    :parameters (?s - step ?s2 - step
                 ?p_a ?p_b ?p_c ?p_d ?p_e - place
                 ?to - peg)
    :precondition (and
      (next ?s ?s2)
      ;; snapshot of where each disk is at step ?s
      (on a ?p_a ?s) (on b ?p_b ?s) (on c ?p_c ?s) (on d ?p_d ?s) (on e ?p_e ?s)
      ;; a must be top (no disk on a at step ?s)
      (not (on b a ?s)) (not (on c a ?s)) (not (on d a ?s)) (not (on e a ?s))
      ;; destination peg must be empty at step ?s
      (not (on a ?to ?s)) (not (on b ?to ?s)) (not (on c ?to ?s)) (not (on d ?to ?s)) (not (on e ?to ?s))
    )
    :effect (and
      ;; remove the "on ... at ?s" facts for all disks
      (not (on a ?p_a ?s)) (not (on b ?p_b ?s)) (not (on c ?p_c ?s)) (not (on d ?p_d ?s)) (not (on e ?p_e ?s))
      ;; add the "on ... at ?s2" facts: a moved to ?to, others retain their places
      (on a ?to ?s2) (on b ?p_b ?s2) (on c ?p_c ?s2) (on d ?p_d ?s2) (on e ?p_e ?s2)
    )
  )

  ;; Move disk a onto another disk (must be larger and top)
  (:action move-a-to-disk
    :parameters (?s - step ?s2 - step
                 ?p_a ?p_b ?p_c ?p_d ?p_e - place
                 ?to - disk)
    :precondition (and
      (next ?s ?s2)
      (on a ?p_a ?s) (on b ?p_b ?s) (on c ?p_c ?s) (on d ?p_d ?s) (on e ?p_e ?s)
      ;; a must be top
      (not (on b a ?s)) (not (on c a ?s)) (not (on d a ?s)) (not (on e a ?s))
      ;; target disk must be top (no disk on ?to at step ?s)
      (not (on a ?to ?s)) (not (on b ?to ?s)) (not (on c ?to ?s)) (not (on d ?to ?s)) (not (on e ?to ?s))
      ;; size ordering: a smaller than destination disk
      (smaller a ?to)
    )
    :effect (and
      (not (on a ?p_a ?s)) (not (on b ?p_b ?s)) (not (on c ?p_c ?s)) (not (on d ?p_d ?s)) (not (on e ?p_e ?s))
      (on a ?to ?s2) (on b ?p_b ?s2) (on c ?p_c ?s2) (on d ?p_d ?s2) (on e ?p_e ?s2)
    )
  )

  ;; Move disk b onto an empty peg
  (:action move-b-to-peg
    :parameters (?s - step ?s2 - step
                 ?p_a ?p_b ?p_c ?p_d ?p_e - place
                 ?to - peg)
    :precondition (and
      (next ?s ?s2)
      (on a ?p_a ?s) (on b ?p_b ?s) (on c ?p_c ?s) (on d ?p_d ?s) (on e ?p_e ?s)
      ;; b must be top
      (not (on a b ?s)) (not (on c b ?s)) (not (on d b ?s)) (not (on e b ?s))
      ;; destination peg must be empty
      (not (on a ?to ?s)) (not (on b ?to ?s)) (not (on c ?to ?s)) (not (on d ?to ?s)) (not (on e ?to ?s))
    )
    :effect (and
      (not (on a ?p_a ?s)) (not (on b ?p_b ?s)) (not (on c ?p_c ?s)) (not (on d ?p_d ?s)) (not (on e ?p_e ?s))
      (on a ?p_a ?s2) (on b ?to ?s2) (on c ?p_c ?s2) (on d ?p_d ?s2) (on e ?p_e ?s2)
    )
  )

  ;; Move disk b onto another disk
  (:action move-b-to-disk
    :parameters (?s - step ?s2 - step
                 ?p_a ?p_b ?p_c ?p_d ?p_e - place
                 ?to - disk)
    :precondition (and
      (next ?s ?s2)
      (on a ?p_a ?s) (on b ?p_b ?s) (on c ?p_c ?s) (on d ?p_d ?s) (on e ?p_e ?s)
      ;; b must be top
      (not (on a b ?s)) (not (on c b ?s)) (not (on d b ?s)) (not (on e b ?s))
      ;; destination disk must be top
      (not (on a ?to ?s)) (not (on b ?to ?s)) (not (on c ?to ?s)) (not (on d ?to ?s)) (not (on e ?to ?s))
      ;; size ordering
      (smaller b ?to)
    )
    :effect (and
      (not (on a ?p_a ?s)) (not (on b ?p_b ?s)) (not (on c ?p_c ?s)) (not (on d ?p_d ?s)) (not (on e ?p_e ?s))
      (on a ?p_a ?s2) (on b ?to ?s2) (on c ?p_c ?s2) (on d ?p_d ?s2) (on e ?p_e ?s2)
    )
  )

  ;; Move disk c onto an empty peg
  (:action move-c-to-peg
    :parameters (?s - step ?s2 - step
                 ?p_a ?p_b ?p_c ?p_d ?p_e - place
                 ?to - peg)
    :precondition (and
      (next ?s ?s2)
      (on a ?p_a ?s) (on b ?p_b ?s) (on c ?p_c ?s) (on d ?p_d ?s) (on e ?p_e ?s)
      ;; c must be top
      (not (on a c ?s)) (not (on b c ?s)) (not (on d c ?s)) (not (on e c ?s))
      ;; destination peg must be empty
      (not (on a ?to ?s)) (not (on b ?to ?s)) (not (on c ?to ?s)) (not (on d ?to ?s)) (not (on e ?to ?s))
    )
    :effect (and
      (not (on a ?p_a ?s)) (not (on b ?p_b ?s)) (not (on c ?p_c ?s)) (not (on d ?p_d ?s)) (not (on e ?p_e ?s))
      (on a ?p_a ?s2) (on b ?p_b ?s2) (on c ?to ?s2) (on d ?p_d ?s2) (on e ?p_e ?s2)
    )
  )

  ;; Move disk c onto another disk
  (:action move-c-to-disk
    :parameters (?s - step ?s2 - step
                 ?p_a ?p_b ?p_c ?p_d ?p_e - place
                 ?to - disk)
    :precondition (and
      (next ?s ?s2)
      (on a ?p_a ?s) (on b ?p_b ?s) (on c ?p_c ?s) (on d ?p_d ?s) (on e ?p_e ?s)
      ;; c must be top
      (not (on a c ?s)) (not (on b c ?s)) (not (on d c ?s)) (not (on e c ?s))
      ;; destination disk must be top
      (not (on a ?to ?s)) (not (on b ?to ?s)) (not (on c ?to ?s)) (not (on d ?to ?s)) (not (on e ?to ?s))
      ;; size ordering
      (smaller c ?to)
    )
    :effect (and
      (not (on a ?p_a ?s)) (not (on b ?p_b ?s)) (not (on c ?p_c ?s)) (not (on d ?p_d ?s)) (not (on e ?p_e ?s))
      (on a ?p_a ?s2) (on b ?p_b ?s2) (on c ?to ?s2) (on d ?p_d ?s2) (on e ?p_e ?s2)
    )
  )

  ;; Move disk d onto an empty peg
  (:action move-d-to-peg
    :parameters (?s - step ?s2 - step
                 ?p_a ?p_b ?p_c ?p_d ?p_e - place
                 ?to - peg)
    :precondition (and
      (next ?s ?s2)
      (on a ?p_a ?s) (on b ?p_b ?s) (on c ?p_c ?s) (on d ?p_d ?s) (on e ?p_e ?s)
      ;; d must be top
      (not (on a d ?s)) (not (on b d ?s)) (not (on c d ?s)) (not (on e d ?s))
      ;; destination peg must be empty
      (not (on a ?to ?s)) (not (on b ?to ?s)) (not (on c ?to ?s)) (not (on d ?to ?s)) (not (on e ?to ?s))
    )
    :effect (and
      (not (on a ?p_a ?s)) (not (on b ?p_b ?s)) (not (on c ?p_c ?s)) (not (on d ?p_d ?s)) (not (on e ?p_e ?s))
      (on a ?p_a ?s2) (on b ?p_b ?s2) (on c ?p_c ?s2) (on d ?to ?s2) (on e ?p_e ?s2)
    )
  )

  ;; Move disk d onto another disk
  (:action move-d-to-disk
    :parameters (?s - step ?s2 - step
                 ?p_a ?p_b ?p_c ?p_d ?p_e - place
                 ?to - disk)
    :precondition (and
      (next ?s ?s2)
      (on a ?p_a ?s) (on b ?p_b ?s) (on c ?p_c ?s) (on d ?p_d ?s) (on e ?p_e ?s)
      ;; d must be top
      (not (on a d ?s)) (not (on b d ?s)) (not (on c d ?s)) (not (on e d ?s))
      ;; destination disk must be top
      (not (on a ?to ?s)) (not (on b ?to ?s)) (not (on c ?to ?s)) (not (on d ?to ?s)) (not (on e ?to ?s))
      ;; size ordering
      (smaller d ?to)
    )
    :effect (and
      (not (on a ?p_a ?s)) (not (on b ?p_b ?s)) (not (on c ?p_c ?s)) (not (on d ?p_d ?s)) (not (on e ?p_e ?s))
      (on a ?p_a ?s2) (on b ?p_b ?s2) (on c ?p_c ?s2) (on d ?to ?s2) (on e ?p_e ?s2)
    )
  )

  ;; Move disk e onto an empty peg
  (:action move-e-to-peg
    :parameters (?s - step ?s2 - step
                 ?p_a ?p_b ?p_c ?p_d ?p_e - place
                 ?to - peg)
    :precondition (and
      (next ?s ?s2)
      (on a ?p_a ?s) (on b ?p_b ?s) (on c ?p_c ?s) (on d ?p_d ?s) (on e ?p_e ?s)
      ;; e must be top
      (not (on a e ?s)) (not (on b e ?s)) (not (on c e ?s)) (not (on d e ?s))
      ;; destination peg must be empty
      (not (on a ?to ?s)) (not (on b ?to ?s)) (not (on c ?to ?s)) (not (on d ?to ?s)) (not (on e ?to ?s))
    )
    :effect (and
      (not (on a ?p_a ?s)) (not (on b ?p_b ?s)) (not (on c ?p_c ?s)) (not (on d ?p_d ?s)) (not (on e ?p_e ?s))
      (on a ?p_a ?s2) (on b ?p_b ?s2) (on c ?p_c ?s2) (on d ?p_d ?s2) (on e ?to ?s2)
    )
  )

  ;; Move disk e onto another disk
  (:action move-e-to-disk
    :parameters (?s - step ?s2 - step
                 ?p_a ?p_b ?p_c ?p_d ?p_e - place
                 ?to - disk)
    :precondition (and
      (next ?s ?s2)
      (on a ?p_a ?s) (on b ?p_b ?s) (on c ?p_c ?s) (on d ?p_d ?s) (on e ?p_e ?s)
      ;; e must be top
      (not (on a e ?s)) (not (on b e ?s)) (not (on c e ?s)) (not (on d e ?s))
      ;; destination disk must be top
      (not (on a ?to ?s)) (not (on b ?to ?s)) (not (on c ?to ?s)) (not (on d ?to ?s)) (not (on e ?to ?s))
      ;; size ordering
      (smaller e ?to)
    )
    :effect (and
      (not (on a ?p_a ?s)) (not (on b ?p_b ?s)) (not (on c ?p_c ?s)) (not (on d ?p_d ?s)) (not (on e ?p_e ?s))
      (on a ?p_a ?s2) (on b ?p_b ?s2) (on c ?p_c ?s2) (on d ?p_d ?s2) (on e ?to ?s2)
    )
  )

)