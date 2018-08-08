function Tree = firstRound(node,Tree)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% �������������CellTree��ÿ���ڵ㸳ֵ
% �����ܹ�������ÿ���ڵ������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Tree{node.index}.isRoot = node.isRoot;
Tree{node.index}.isLeaf = node.isLeaf;
Tree{node.index}.isLeft = node.isLeft;
Tree{node.index}.isRight = node.isRight;
Tree{node.index}.hasLeft = node.hasLeft;
Tree{node.index}.hasRight = node.hasRight;
Tree{node.index}.r = node.r;
Tree{node.index}.val = node.val;
Tree{node.index}.index = node.index;
if node.isRoot ~= 1
    Tree{node.index}.parent = node.parent.index;
end
if node.hasLeft == 1
    Tree{node.index}.left = node.left.index;
    Tree = firstRound(node.left,Tree);
end
if node.hasRight == 1
    Tree{node.index}.right = node.right.index;
    Tree = firstRound(node.right,Tree);
end