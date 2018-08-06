function node = search_down(currentNode,target)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% �ӵ�ǰ�ڵ�����������kd���ĵײ�
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
while currentNode.isLeaf == 0
    r = currentNode.r;
    if target(r)<currentNode.val(r)
        if currentNode.hasLeft == 1
            currentNode = currentNode.left;
        else
            break;
        end
    else
        if currentNode.hasRight == 1
            currentNode = currentNode.right;
        else
            break;
        end
    end
end
currentNode.visited = 1; 
node = currentNode;