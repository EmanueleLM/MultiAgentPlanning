(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place step place)

  (:predicates
    (on ?d - disk ?p - place)     ; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)            ; nothing on top of place ?p (peg empty or disk top)
    (smaller ?d1 - disk ?d2 - disk) ; size ordering: ?d1 is smaller than ?d2

    (time-now ?s - step)
    (next ?s1 - step ?s2 - step)
  )

  ;; move a disk that is the only/top disk on a peg to an empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (time-now ?s)
      (next ?s ?s2)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (clear ?from)      ; source peg becomes empty (or remains empty)
      (not (clear ?to))  ; destination peg now occupied

      (clear ?d)         ; moved disk is top of its new stack

      (not (time-now ?s))
      (time-now ?s2)
    )
  )

  ;; move top disk from a peg onto a top disk on another peg (peg -> disk)
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (time-now ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (clear ?from)
      (not (clear ?to))

      (clear ?d)

      (not (time-now ?s))
      (time-now ?s2)
    )
  )

  ;; move top disk from on top of a disk to an empty peg (disk -> peg)
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (time-now ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (clear ?from)     ; the supporting disk becomes top
      (not (clear ?to)) ; destination peg becomes occupied

      (clear ?d)

      (not (time-now ?s))
      (time-now ?s2)
    )
  )

  ;; move top disk from on top of a disk onto a top disk on another peg (disk -> disk)
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (time-now ?s)
      (next ?s ?s2)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (clear ?from)
      (not (clear ?to))

      (clear ?d)

      (not (time-now ?s))
      (time-now ?s2)
    )
  )
)