(define (domain hanoi-five)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place step)

  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (a peg or another disk)
    (curr ?s - step)                 ; current active step/stage
    (next ?s - step ?s2 - step)      ; successor relation between steps
    (smaller ?d1 - disk ?d2 - disk)  ; static size ordering: ?d1 is smaller than ?d2
    (peg ?p - peg)                   ; helper predicate to bind peg variables
    (disk ?d - disk)                 ; helper predicate to bind disk variables
  )

  ;; Move the smallest disk a onto an empty peg
  (:action move-a-to-peg
    :parameters (?s ?s2 - step ?from - place ?to - peg)
    :precondition (and
      (curr ?s)
      (next ?s ?s2)
      (on a ?from)
      (peg ?to)
      ;; a must be top (no disk on a)
      (not (on b a)) (not (on c a)) (not (on d a)) (not (on e a))
      ;; destination peg must be empty (no disk on ?to)
      (not (on a ?to)) (not (on b ?to)) (not (on c ?to)) (not (on d ?to)) (not (on e ?to))
    )
    :effect (and
      (not (on a ?from)) (on a ?to)
      (not (curr ?s)) (curr ?s2)
    )
  )

  ;; Move the smallest disk a onto another disk (must be larger and top)
  (:action move-a-to-disk
    :parameters (?s ?s2 - step ?from - place ?to - disk)
    :precondition (and
      (curr ?s)
      (next ?s ?s2)
      (on a ?from)
      (disk ?to)
      ;; a must be top
      (not (on b a)) (not (on c a)) (not (on d a)) (not (on e a))
      ;; target disk must be top
      (not (on a ?to)) (not (on b ?to)) (not (on c ?to)) (not (on d ?to)) (not (on e ?to))
      ;; size ordering: a smaller than destination disk
      (smaller a ?to)
    )
    :effect (and
      (not (on a ?from)) (on a ?to)
      (not (curr ?s)) (curr ?s2)
    )
  )

  ;; Move disk b onto an empty peg
  (:action move-b-to-peg
    :parameters (?s ?s2 - step ?from - place ?to - peg)
    :precondition (and
      (curr ?s)
      (next ?s ?s2)
      (on b ?from)
      (peg ?to)
      ;; b must be top
      (not (on a b)) (not (on c b)) (not (on d b)) (not (on e b))
      ;; destination peg must be empty
      (not (on a ?to)) (not (on b ?to)) (not (on c ?to)) (not (on d ?to)) (not (on e ?to))
    )
    :effect (and
      (not (on b ?from)) (on b ?to)
      (not (curr ?s)) (curr ?s2)
    )
  )

  ;; Move disk b onto another disk
  (:action move-b-to-disk
    :parameters (?s ?s2 - step ?from - place ?to - disk)
    :precondition (and
      (curr ?s)
      (next ?s ?s2)
      (on b ?from)
      (disk ?to)
      ;; b must be top
      (not (on a b)) (not (on c b)) (not (on d b)) (not (on e b))
      ;; destination disk must be top
      (not (on a ?to)) (not (on b ?to)) (not (on c ?to)) (not (on d ?to)) (not (on e ?to))
      ;; size ordering
      (smaller b ?to)
    )
    :effect (and
      (not (on b ?from)) (on b ?to)
      (not (curr ?s)) (curr ?s2)
    )
  )

  ;; Move disk c onto an empty peg
  (:action move-c-to-peg
    :parameters (?s ?s2 - step ?from - place ?to - peg)
    :precondition (and
      (curr ?s)
      (next ?s ?s2)
      (on c ?from)
      (peg ?to)
      ;; c must be top
      (not (on a c)) (not (on b c)) (not (on d c)) (not (on e c))
      ;; destination peg must be empty
      (not (on a ?to)) (not (on b ?to)) (not (on c ?to)) (not (on d ?to)) (not (on e ?to))
    )
    :effect (and
      (not (on c ?from)) (on c ?to)
      (not (curr ?s)) (curr ?s2)
    )
  )

  ;; Move disk c onto another disk
  (:action move-c-to-disk
    :parameters (?s ?s2 - step ?from - place ?to - disk)
    :precondition (and
      (curr ?s)
      (next ?s ?s2)
      (on c ?from)
      (disk ?to)
      ;; c must be top
      (not (on a c)) (not (on b c)) (not (on d c)) (not (on e c))
      ;; destination disk must be top
      (not (on a ?to)) (not (on b ?to)) (not (on c ?to)) (not (on d ?to)) (not (on e ?to))
      ;; size ordering
      (smaller c ?to)
    )
    :effect (and
      (not (on c ?from)) (on c ?to)
      (not (curr ?s)) (curr ?s2)
    )
  )

  ;; Move disk d onto an empty peg
  (:action move-d-to-peg
    :parameters (?s ?s2 - step ?from - place ?to - peg)
    :precondition (and
      (curr ?s)
      (next ?s ?s2)
      (on d ?from)
      (peg ?to)
      ;; d must be top
      (not (on a d)) (not (on b d)) (not (on c d)) (not (on e d))
      ;; destination peg must be empty
      (not (on a ?to)) (not (on b ?to)) (not (on c ?to)) (not (on d ?to)) (not (on e ?to))
    )
    :effect (and
      (not (on d ?from)) (on d ?to)
      (not (curr ?s)) (curr ?s2)
    )
  )

  ;; Move disk d onto another disk
  (:action move-d-to-disk
    :parameters (?s ?s2 - step ?from - place ?to - disk)
    :precondition (and
      (curr ?s)
      (next ?s ?s2)
      (on d ?from)
      (disk ?to)
      ;; d must be top
      (not (on a d)) (not (on b d)) (not (on c d)) (not (on e d))
      ;; destination disk must be top
      (not (on a ?to)) (not (on b ?to)) (not (on c ?to)) (not (on d ?to)) (not (on e ?to))
      ;; size ordering
      (smaller d ?to)
    )
    :effect (and
      (not (on d ?from)) (on d ?to)
      (not (curr ?s)) (curr ?s2)
    )
  )

  ;; Move the largest disk e onto an empty peg
  (:action move-e-to-peg
    :parameters (?s ?s2 - step ?from - place ?to - peg)
    :precondition (and
      (curr ?s)
      (next ?s ?s2)
      (on e ?from)
      (peg ?to)
      ;; e must be top
      (not (on a e)) (not (on b e)) (not (on c e)) (not (on d e))
      ;; destination peg must be empty
      (not (on a ?to)) (not (on b ?to)) (not (on c ?to)) (not (on d ?to)) (not (on e ?to))
    )
    :effect (and
      (not (on e ?from)) (on e ?to)
      (not (curr ?s)) (curr ?s2)
    )
  )

  ;; Move the largest disk e onto another disk
  (:action move-e-to-disk
    :parameters (?s ?s2 - step ?from - place ?to - disk)
    :precondition (and
      (curr ?s)
      (next ?s ?s2)
      (on e ?from)
      (disk ?to)
      ;; e must be top
      (not (on a e)) (not (on b e)) (not (on c e)) (not (on d e))
      ;; destination disk must be top
      (not (on a ?to)) (not (on b ?to)) (not (on c ?to)) (not (on d ?to)) (not (on e ?to))
      ;; size ordering
      (smaller e ?to)
    )
    :effect (and
      (not (on e ?from)) (on e ?to)
      (not (curr ?s)) (curr ?s2)
    )
  )

)