(define (domain hanoi-multiagent-10)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent disk peg move)

  (:predicates
    ;; disk-location and order
    (on ?d - disk ?p - peg)         ; disk ?d is on peg ?p (loosely tracked)
    (top ?d - disk ?p - peg)        ; disk ?d is currently the top disk of peg ?p
    (empty ?p - peg)                ; peg ?p is empty (no top)

    ;; static size relation
    (smaller ?d1 - disk ?d2 - disk)

    ;; move-object attributes (bound in problem)
    (move-disk ?m - move ?d - disk)
    (move-from ?m - move ?p - peg)
    (move-to ?m - move ?p - peg)
    (move-agent ?m - move ?a - agent)

    ;; sequencing for global chain of move objects
    (next ?m1 - move ?m2 - move)
    (ready ?m - move)
    (done ?m - move)

    ;; helper facts bound per-move in the problem describing the expected situation
    ;; when a move expects a non-empty destination, dest-top points to the disk that must
    ;; already be top at the destination peg before the move.
    (dest-top ?m - move ?d - disk)

    ;; helper facts describing which disk (if any) becomes top at the source peg after this move.
    ;; Exactly one of (becomes-top ?m ?d) or (becomes-empty ?m) will hold for each move in the problem.
    (becomes-top ?m - move ?d - disk)
    (becomes-empty ?m - move)
  )

  ;; Action: execute a prepared move when destination is non-empty and source becomes non-empty.
  (:action execute-move-dest-disk-src-disk
    :parameters (?m - move ?d - disk ?from - peg ?to - peg ?a - agent ?destTop - disk ?nextm - move ?newTop - disk)
    :precondition (and
      (ready ?m)
      (move-disk ?m ?d)
      (move-from ?m ?from)
      (move-to ?m ?to)
      (move-agent ?m ?a)
      (dest-top ?m ?destTop)
      (becomes-top ?m ?newTop)
      (next ?m ?nextm)

      (on ?d ?from)
      (top ?d ?from)
      (top ?destTop ?to)
      (smaller ?d ?destTop)
    )
    :effect (and
      ;; move disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update top facts
      (not (top ?d ?from))
      (top ?d ?to)
      (not (top ?newTop ?from))
      (top ?newTop ?from)

      ;; destination no longer empty
      (not (empty ?to))

      ;; sequencing
      (not (ready ?m))
      (done ?m)
      (ready ?nextm)
    )
  )

  ;; Action: execute a prepared move when destination is non-empty and source becomes empty.
  (:action execute-move-dest-disk-src-empty
    :parameters (?m - move ?d - disk ?from - peg ?to - peg ?a - agent ?destTop - disk ?nextm - move)
    :precondition (and
      (ready ?m)
      (move-disk ?m ?d)
      (move-from ?m ?from)
      (move-to ?m ?to)
      (move-agent ?m ?a)
      (dest-top ?m ?destTop)
      (becomes-empty ?m)
      (next ?m ?nextm)

      (on ?d ?from)
      (top ?d ?from)
      (top ?destTop ?to)
      (smaller ?d ?destTop)
    )
    :effect (and
      ;; move disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update top facts
      (not (top ?d ?from))
      (top ?d ?to)

      ;; mark source empty
      (empty ?from)

      ;; destination no longer empty
      (not (empty ?to))

      ;; sequencing
      (not (ready ?m))
      (done ?m)
      (ready ?nextm)
    )
  )

  ;; Action: execute a prepared move when destination is empty and source becomes non-empty.
  (:action execute-move-dest-empty-src-disk
    :parameters (?m - move ?d - disk ?from - peg ?to - peg ?a - agent ?nextm - move ?newTop - disk)
    :precondition (and
      (ready ?m)
      (move-disk ?m ?d)
      (move-from ?m ?from)
      (move-to ?m ?to)
      (move-agent ?m ?a)
      (becomes-top ?m ?newTop)
      (next ?m ?nextm)

      (on ?d ?from)
      (top ?d ?from)
      (empty ?to)
    )
    :effect (and
      ;; move disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update top facts
      (not (top ?d ?from))
      (top ?d ?to)
      (not (top ?newTop ?from))
      (top ?newTop ?from)

      ;; destination no longer empty
      (not (empty ?to))

      ;; sequencing
      (not (ready ?m))
      (done ?m)
      (ready ?nextm)
    )
  )

  ;; Action: execute a prepared move when destination is empty and source becomes empty.
  (:action execute-move-dest-empty-src-empty
    :parameters (?m - move ?d - disk ?from - peg ?to - peg ?a - agent ?nextm - move)
    :precondition (and
      (ready ?m)
      (move-disk ?m ?d)
      (move-from ?m ?from)
      (move-to ?m ?to)
      (move-agent ?m ?a)
      (becomes-empty ?m)
      (next ?m ?nextm)

      (on ?d ?from)
      (top ?d ?from)
      (empty ?to)
    )
    :effect (and
      ;; move disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update top facts
      (not (top ?d ?from))
      (top ?d ?to)

      ;; source now empty
      (empty ?from)

      ;; destination no longer empty
      (not (empty ?to))

      ;; sequencing
      (not (ready ?m))
      (done ?m)
      (ready ?nextm)
    )
  )
)