(define (problem Hanoi3Agents20DisksInstance14)
  (:domain three-agent-hanoi-20)

  (:objects
    left middle right - peg
    A B C D E F G H I J K L M N O P Q R S T - disk
  )

  (:init
    ; Initial direct-on relations (top-to-bottom on left: A B C D E F G H I J K L M N O P Q R S T)
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)
    (on-disk H I)
    (on-disk I J)
    (on-disk J K)
    (on-disk K L)
    (on-disk L M)
    (on-disk M N)
    (on-disk N O)
    (on-disk O P)
    (on-disk P Q)
    (on-disk Q R)
    (on-disk R S)
    (on-disk S T)
    (on-peg T left)

    ; Clear markers: initially only the topmost disk A is clear; middle and right pegs are clear
    (clear-disk A)
    (clear-peg middle)
    (clear-peg right)

    ; Agent movement permissions according to specification
    (movable1 A) (movable1 B) (movable1 C) (movable1 D) (movable1 E) (movable1 F) (movable1 G)
    (movable2 H) (movable2 I) (movable2 J) (movable2 K) (movable2 L) (movable2 M) (movable2 N)
    (movable3 O) (movable3 P) (movable3 Q) (movable3 R) (movable3 S) (movable3 T)

    ; Disk size ordering: larger ?big ?small when ?big is strictly larger than ?small
    (larger B A)  (larger C A)  (larger C B)
    (larger D A)  (larger D B)  (larger D C)
    (larger E A)  (larger E B)  (larger E C)  (larger E D)
    (larger F A)  (larger F B)  (larger F C)  (larger F D)  (larger F E)
    (larger G A)  (larger G B)  (larger G C)  (larger G D)  (larger G E)  (larger G F)
    (larger H A)  (larger H B)  (larger H C)  (larger H D)  (larger H E)  (larger H F)  (larger H G)
    (larger I A)  (larger I B)  (larger I C)  (larger I D)  (larger I E)  (larger I F)  (larger I G)  (larger I H)
    (larger J A)  (larger J B)  (larger J C)  (larger J D)  (larger J E)  (larger J F)  (larger J G)  (larger J H)  (larger J I)
    (larger K A)  (larger K B)  (larger K C)  (larger K D)  (larger K E)  (larger K F)  (larger K G)  (larger K H)  (larger K I)  (larger K J)
    (larger L A)  (larger L B)  (larger L C)  (larger L D)  (larger L E)  (larger L F)  (larger L G)  (larger L H)  (larger L I)  (larger L J)  (larger L K)
    (larger M A)  (larger M B)  (larger M C)  (larger M D)  (larger M E)  (larger M F)  (larger M G)  (larger M H)  (larger M I)  (larger M J)  (larger M K)  (larger M L)
    (larger N A)  (larger N B)  (larger N C)  (larger N D)  (larger N E)  (larger N F)  (larger N G)  (larger N H)  (larger N I)  (larger N J)  (larger N K)  (larger N L)  (larger N M)
    (larger O A)  (larger O B)  (larger O C)  (larger O D)  (larger O E)  (larger O F)  (larger O G)  (larger O H)  (larger O I)  (larger O J)  (larger O K)  (larger O L)  (larger O M)  (larger O N)
    (larger P A)  (larger P B)  (larger P C)  (larger P D)  (larger P E)  (larger P F)  (larger P G)  (larger P H)  (larger P I)  (larger P J)  (larger P K)  (larger P L)  (larger P M)  (larger P N)  (larger P O)
    (larger Q A)  (larger Q B)  (larger Q C)  (larger Q D)  (larger Q E)  (larger Q F)  (larger Q G)  (larger Q H)  (larger Q I)  (larger Q J)  (larger Q K)  (larger Q L)  (larger Q M)  (larger Q N)  (larger Q O)  (larger Q P)
    (larger R A)  (larger R B)  (larger R C)  (larger R D)  (larger R E)  (larger R F)  (larger R G)  (larger R H)  (larger R I)  (larger R J)  (larger R K)  (larger R L)  (larger R M)  (larger R N)  (larger R O)  (larger R P)  (larger R Q)
    (larger S A)  (larger S B)  (larger S C)  (larger S D)  (larger S E)  (larger S F)  (larger S G)  (larger S H)  (larger S I)  (larger S J)  (larger S K)  (larger S L)  (larger S M)  (larger S N)  (larger S O)  (larger S P)  (larger S Q)  (larger S R)
    (larger T A)  (larger T B)  (larger T C)  (larger T D)  (larger T E)  (larger T F)  (larger T G)  (larger T H)  (larger T I)  (larger T J)  (larger T K)  (larger T L)  (larger T M)  (larger T N)  (larger T O)  (larger T P)  (larger T Q)  (larger T R)  (larger T S)
  )

  (:goal
    (and
      ; Middle peg should have top-to-bottom A B C D (A on B, B on C, C on D, D on middle)
      (on-disk A B)
      (on-disk B C)
      (on-disk C D)
      (on-peg D middle)

      ; Left peg should have top-to-bottom E F G H I J K L M N O P Q R S T
      (on-disk E F)
      (on-disk F G)
      (on-disk G H)
      (on-disk H I)
      (on-disk I J)
      (on-disk J K)
      (on-disk K L)
      (on-disk L M)
      (on-disk M N)
      (on-disk N O)
      (on-disk O P)
      (on-disk P Q)
      (on-disk Q R)
      (on-disk R S)
      (on-disk S T)
      (on-peg T left)

      ; Right peg must be empty (clear)
      (clear-peg right)
    )
  )
)