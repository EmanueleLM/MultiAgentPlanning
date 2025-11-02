(define (problem Hanoi3Agents15DisksInstance14)
  (:domain hanoi_multi_agent)
  (:objects
    A B C D E F G H I J K L M N O - disk
    left middle right - peg
  )

  (:init
    ; initial stack encoded as immediate-on relations: top A on B, B on C, ..., N on O, O on left peg
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J K)
    (on K L)
    (on L M)
    (on M N)
    (on N O)
    (on O left)

    ; only top disk has clear = true initially (A is top); all other disks initially have a disk on them
    (clear A)
    ; other disks are not clear (omitted): B,C,...O initially have disks on top of them -> clear false

    ; pegs
    (empty middle)
    (empty right)
    ; left is not empty (bottom O sits on left) -> empty left omitted / false

    ; size ordering (larger X Y if X is strictly larger than Y)
    ; O largest -> larger than N..A
    (larger O N) (larger O M) (larger O L) (larger O K) (larger O J) (larger O I) (larger O H) (larger O G)
    (larger O F) (larger O E) (larger O D) (larger O C) (larger O B) (larger O A)
    (larger N M) (larger N L) (larger N K) (larger N J) (larger N I) (larger N H) (larger N G)
    (larger N F) (larger N E) (larger N D) (larger N C) (larger N B) (larger N A)
    (larger M L) (larger M K) (larger M J) (larger M I) (larger M H) (larger M G) (larger M F)
    (larger M E) (larger M D) (larger M C) (larger M B) (larger M A)
    (larger L K) (larger L J) (larger L I) (larger L H) (larger L G) (larger L F) (larger L E)
    (larger L D) (larger L C) (larger L B) (larger L A)
    (larger K J) (larger K I) (larger K H) (larger K G) (larger K F) (larger K E) (larger K D)
    (larger K C) (larger K B) (larger K A)
    (larger J I) (larger J H) (larger J G) (larger J F) (larger J E) (larger J D) (larger J C)
    (larger J B) (larger J A)
    (larger I H) (larger I G) (larger I F) (larger I E) (larger I D) (larger I C) (larger I B)
    (larger I A)
    (larger H G) (larger H F) (larger H E) (larger H D) (larger H C) (larger H B) (larger H A)
    (larger G F) (larger G E) (larger G D) (larger G C) (larger G B) (larger G A)
    (larger F E) (larger F D) (larger F C) (larger F B) (larger F A)
    (larger E D) (larger E C) (larger E B) (larger E A)
    (larger D C) (larger D B) (larger D A)
    (larger C B) (larger C A)
    (larger B A)

    ; The following 'clear' facts are set/assumed false by omission initially for clarity:
    ; clear B, clear C, ..., clear O are false initially.
  )

  (:goal (and
    ; left peg must have top-to-bottom B,D,E,F,G,H,I,J,K,L,M,N,O
    (on B D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J K)
    (on K L)
    (on L M)
    (on M N)
    (on N O)
    (on O left)

    ; middle peg empty
    (empty middle)

    ; right peg must have top-to-bottom A,C
    (on A C)
    (on C right)
  ))
)