(define (domain hanoi6)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  ;; Predicates:
  ;; (disk ?d) and (peg ?p) : typing markers (also included in objects)
  ;; (on-peg ?d ?p) : disk ?d is directly on peg ?p
  ;; (on-disk ?d ?d2) : disk ?d is directly on disk ?d2
  ;; (top ?p ?d) : disk ?d is the topmost disk on peg ?p
  ;; (top-empty ?p) : peg ?p currently has no disks
  ;; (smaller ?d1 ?d2) : disk ?d1 is strictly smaller than disk ?d2
  (:predicates
    (disk ?d - disk)
    (peg ?p - peg)
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?d2 - disk)
    (top ?p - peg ?d - disk)
    (top-empty ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; MOVER actions (named to indicate mover provenance)  ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ; Move a top disk that is directly on a peg to an empty peg
  (:action mover_move_onpeg_to_emptypeg
    :parameters (?d - disk ?p - peg ?q - peg)
    :precondition (and
      (disk ?d)
      (peg ?p) (peg ?q)
      (top ?p ?d)
      (on-peg ?d ?p)
      (top-empty ?q)
    )
    :effect (and
      (not (top ?p ?d))
      (not (on-peg ?d ?p))
      (not (top-empty ?q))
      (top-empty ?p)
      (on-peg ?d ?q)
      (top ?q ?d)
    )
  )

  ; Move a top disk that is directly on a peg to become directly on another top disk
  (:action mover_move_onpeg_to_disk
    :parameters (?d - disk ?p - peg ?q - peg ?dest - disk)
    :precondition (and
      (disk ?d) (disk ?dest)
      (peg ?p) (peg ?q)
      (top ?p ?d)
      (on-peg ?d ?p)
      (top ?q ?dest)
      (smaller ?d ?dest)
    )
    :effect (and
      (not (top ?p ?d))
      (not (on-peg ?d ?p))
      (not (top ?q ?dest))
      (top-empty ?p)
      (on-disk ?d ?dest)
      (top ?q ?d)
    )
  )

  ; Move a top disk that is directly on another disk to an empty peg
  (:action mover_move_ondisk_to_emptypeg
    :parameters (?d - disk ?under - disk ?p - peg ?q - peg)
    :precondition (and
      (disk ?d) (disk ?under)
      (peg ?p) (peg ?q)
      (top ?p ?d)
      (on-disk ?d ?under)
      (top-empty ?q)
    )
    :effect (and
      (not (top ?p ?d))
      (not (on-disk ?d ?under))
      (not (top-empty ?q))
      (top ?q ?d)
      (on-peg ?d ?q)
      (top ?p ?under)
    )
  )

  ; Move a top disk that is directly on another disk to become directly on another top disk
  (:action mover_move_ondisk_to_disk
    :parameters (?d - disk ?under - disk ?p - peg ?q - peg ?dest - disk)
    :precondition (and
      (disk ?d) (disk ?under) (disk ?dest)
      (peg ?p) (peg ?q)
      (top ?p ?d)
      (on-disk ?d ?under)
      (top ?q ?dest)
      (smaller ?d ?dest)
    )
    :effect (and
      (not (top ?p ?d))
      (not (on-disk ?d ?under))
      (not (top ?q ?dest))
      (top ?q ?d)
      (on-disk ?d ?dest)
      (top ?p ?under)
    )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Inspector/Auditor invariants are encoded directly   ;;
  ;; through action preconditions and the predicates     ;;
  ;; (no separate 'repair' or penalty actions provided)  ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

)