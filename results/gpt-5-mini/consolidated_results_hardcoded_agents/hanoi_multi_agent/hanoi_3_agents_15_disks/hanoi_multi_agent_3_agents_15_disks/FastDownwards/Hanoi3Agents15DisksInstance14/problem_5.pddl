(define (problem Hanoi3Agents15DisksInstance14)
  (:domain hanoi_multi_agent)
  (:objects
    A B C D E F G H I J K L M N O - disk
    left middle right - peg
  )

  (:init
    ;; stack on left top-to-bottom: A on B on C ... on N on O on left
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

    ;; clear markers: only top disk A and empty pegs middle and right are clear
    (clear A)
    (clear middle)
    (clear right)

    ;; agent permissions
    (allowed_agent_1 A) (allowed_agent_1 B) (allowed_agent_1 C) (allowed_agent_1 D) (allowed_agent_1 E)
    (allowed_agent_2 F) (allowed_agent_2 G) (allowed_agent_2 H) (allowed_agent_2 I) (allowed_agent_2 J)
    (allowed_agent_3 K) (allowed_agent_3 L) (allowed_agent_3 M) (allowed_agent_3 N) (allowed_agent_3 O)

    ;; size ordering: larger X Y means X is larger than Y
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
  )

  (:goal (and
    ;; Left peg target stack top-to-bottom: B on D on E ... on N on O on left
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

    ;; middle peg empty
    (clear middle)

    ;; right peg target stack top-to-bottom: A on C on right
    (on A C)
    (on C right)
  ))
)