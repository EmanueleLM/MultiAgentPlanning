(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)
  (:predicates
    ;; on ?d ?p : disk ?d is directly supported by place ?p (peg or disk)
    (on ?d - disk ?p - place)
    ;; clear ?p : there is no disk directly on place ?p
    (clear ?p - place)
    ;; static size order between disks
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?s - place ?p - peg)
    :precondition (and
      (on ?d ?s)       ;; explicit immediate support being changed
      (clear ?d)       ;; only top disks may be moved
      (clear ?p)       ;; destination place must be empty (peg empty)
    )
    :effect (and
      (not (on ?d ?s)) ;; remove old support
      (on ?d ?p)       ;; add new support (now on peg)
      (not (clear ?p)) ;; peg is no longer empty
      (clear ?s)       ;; previous support becomes clear
    )
  )

  ;; Move a top disk onto another disk (must be smaller than the disk it is placed on)
  (:action move-onto-disk
    :parameters (?d - disk ?s - place ?t - disk)
    :precondition (and
      (on ?d ?s)        ;; explicit immediate support being changed
      (clear ?d)        ;; only top disks may be moved
      (clear ?t)        ;; destination disk must be top (no disk on it)
      (smaller ?d ?t)   ;; size ordering: moved disk must be smaller than destination disk
    )
    :effect (and
      (not (on ?d ?s))  ;; remove old support
      (on ?d ?t)        ;; add new support (now on disk t)
      (not (clear ?t))  ;; t is no longer clear
      (clear ?s)        ;; previous support becomes clear
    )
  )
)