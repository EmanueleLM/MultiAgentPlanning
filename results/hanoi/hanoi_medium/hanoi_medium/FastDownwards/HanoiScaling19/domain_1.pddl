(define (domain hanoi)
  (:requirements :typing :strips :negative-preconditions)
  (:types disk peg - place step)

  (:predicates
    ;; immediate support: disk ?d is immediately on place ?p (place = disk or peg)
    (on ?d - disk ?p - place)

    ;; nothing immediately on this place (used for both disks and pegs)
    (clear ?p - place)

    ;; static size ordering: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)

    ;; explicit time/stage ordering
    (next ?s1 - step ?s2 - step)
    (current ?s - step)
  )

  ;; Move top disk ?d from any place ?from onto an empty destination peg ?peg,
  ;; advancing the global current step from ?s1 to ?s2 (must be consecutive: next ?s1 ?s2).
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?peg - peg ?s1 - step ?s2 - step)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)

      (on ?d ?from)    ;; ?d is immediately on ?from
      (clear ?d)       ;; ?d is topmost
      (clear ?peg)     ;; destination peg is empty (top available)
    )
    :effect (and
      ;; advance step
      (not (current ?s1))
      (current ?s2)

      ;; move disk
      (not (on ?d ?from))
      (on ?d ?peg)

      ;; destination peg now has something immediately on it, so not clear
      (not (clear ?peg))

      ;; the place that formerly supported ?d becomes clear
      (clear ?from)

      ;; moved disk remains clear (topmost)
      (clear ?d)
    )
  )

  ;; Move top disk ?d from any place ?from onto top of disk ?top,
  ;; advancing the global current step from ?s1 to ?s2.
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?top - disk ?s1 - step ?s2 - step)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)

      (on ?d ?from)    ;; ?d is immediately on ?from
      (clear ?d)       ;; ?d is topmost
      (clear ?top)     ;; ?top is topmost on its support (peg or disk)
      (smaller ?d ?top) ;; size constraint: can't place larger on smaller
    )
    :effect (and
      ;; advance step
      (not (current ?s1))
      (current ?s2)

      ;; move disk
      (not (on ?d ?from))
      (on ?d ?top)

      ;; the place that formerly supported ?d becomes clear
      (clear ?from)

      ;; the disk that receives ?d is no longer clear
      (not (clear ?top))

      ;; moved disk remains clear (topmost)
      (clear ?d)
    )
  )
)