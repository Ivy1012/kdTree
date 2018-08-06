function nearest = kd_search(kdTree,target)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ����
% 2018/8/6
% kd�������ڽ�����
% kdTree�����ݵ㼯������kd���ĸ��ڵ�
% target��Ŀ�������
% nearst���㼯�о���Ŀ�������ĵ�����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
currentNode = kdTree;

currentNode = search_down(currentNode,target);% ��currentNode�����������ײ�

currentNearest = currentNode.val;                    % ��ǰ�����
currentNearestDist = norm(currentNearest-target);    % ��ǰ�������
   
while currentNode.isRoot == 0
    isLeft = currentNode.isLeft;     %��ǰ�ڵ������ӱ�־
    currentNode = currentNode.parent;
    if currentNode.visited == 0
        currentNode.visited = 1;
        temp = norm(currentNode.val-target);
        if temp<currentNearestDist
            currentNearest = currentNode.val;
            currentNearestDist = temp;
        end
        temp = abs(currentNode.val(currentNode.r)-target(currentNode.r));   %�뵱ǰ�ָ��ߵľ���
        if temp<currentNearestDist 
            %��ǰ�ָ��߾���С�ڵ�ǰ��С���룬�ڷָ�����һ�߿����и����㣬��������һ�߼�������
            if isLeft == 1
                if currentNode.hasRight == 1 %��ǰ�ڵ������ӣ��Ҹ��׽ڵ����Һ��ӣ����������׽ڵ���Һ���
                    currentNode = currentNode.right;
                    currentNode = search_down(currentNode,target);                
                    temp = norm(target - currentNode.val);
                    if temp < currentNearestDist
                        currentNearest = currentNode.val;
                    end
                end
            else
                if currentNode.hasLeft == 1  %��ǰ�ڵ����Һ��ӣ��Ҹ��׽ڵ������ӣ����������׽ڵ������
                    currentNode = currentNode.left;
                    currentNode = search_down(currentNode,target);
                    temp = norm(target - currentNode.val);
                    if temp < currentNearestDist
                        currentNearest = currentNode.val;
                    end
                end
            end
        end
    end
end
nearest = currentNearest;
            
        
            
        
